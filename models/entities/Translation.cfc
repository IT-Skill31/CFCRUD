component table="tab_translations" extends="quick.models.BaseEntity" accessors="true" {

	property name="translationID" column="tsl_translation_id" ;
	property name="translationBundleName" column="tsl_bundle_nm";
	property name="translationDictionaryKey" column="tsl_dictionary_key";
	property name="translationTranslatedKey" column="tsl_translated_key";
	property name="translationTranslatedAscii" column="tsl_translated_ascii";
	property name="translationStatus" column="tsl_key_translated";

	// Quick assumes auto-incrementing key type by default
	variables._key = "translationID";

	// Relationships

	function dictionaryKey() {
		return belongsTo ( "DictionaryKey","tsl_dictionary_key","dix_dictionary_key" );
	}

	function resourceBundle() {
		return belongsTo ( "ResourceBundle","tsl_bundle_nm","rsb_rbundle_nm" );
	}

	// Scopes

	function scopeApproved( query ) {
        return query.where( "translationStatus", 1 );
    }

	function scopePendingApproval( query ) {
        return query.where( function(q) {
			q.where("translationStatus", 0)
			.where("translationTranslatedAscii", "<>", "")
			.where("translationTranslatedKey", "<>", "")
			}) ;
    }

	function scopeUntranslated( query ) {
        return query.where( function(q) {
			q.where("translationStatus", 0)
			.orWhere("translationTranslatedKey", "")
			}) ;
    }

	function scopeIncomplete( query ) {
        return query.where( function(q) {
			q.whereNull("translationTranslatedAscii")
			.orWhere("translationTranslatedAscii", "")
			}) ;
    }

	// Other methods

	public array function incompleteTranslations() {	

	var aTranslations = _wirebox.getInstance( "Translation" )
		.with( "ResourceBundle" )
		.orderBy("translationDictionaryKey")
		.orderBy("translationBundleName")
		.incomplete()
		.get();	

	return aTranslations;

	}

	public array function approvedTranslationsForLocale(locale) {	

	var aTranslations = _wirebox.getInstance( "Translation" )
		.with( "ResourceBundle" )
		.where("translationBundleName", "LIKE", "%_#locale#")
		.orderBy("translationDictionaryKey")
		.orderBy("translationBundleName")
		.approved()
		.get();	

	return aTranslations;

	}

	public array function approvedTranslationsForBundle(bundleCD) {	

	var aTranslations = _wirebox.getInstance( "Translation" )
		.with( "ResourceBundle" )
		.where("translationBundleName", "LIKE", "#bundleCD#%")
		.orderBy("translationDictionaryKey")
		.orderBy("translationBundleName")
		.approved()
		.get();	

	return aTranslations;

	}
	
}
