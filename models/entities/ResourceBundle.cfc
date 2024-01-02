component table="tab_resource_bundles" extends="quick.models.BaseEntity" accessors="true" {

	property name="resourceBundleName" column="rsb_rbundle_nm" ;
	property name="resourceBundleCD" column="rsb_rbundle_cd" ;
	property name="resourceBundleLocaleCD" column="rsb_locale_cd" ;
	property name="resourceBundleTargetLanguageCD" column="rsb_target_language_cd" ;
	property name="resourceBundleComment" column="rsb_comment" ;
	
	variables._key = "resourceBundleName";

	function keyType() {
        return variables._wirebox.getInstance( "NullKeyType@quick" );
    }

	// Relationships

	function translations() {
       return hasMany( "Translation" );
    }

	function bundle() {
		return belongsTo ( "Bundle","rsb_rbundle_cd","bun_bundle_cd" );
	}

	function language() {
		return belongsTo ( "Language","rsb_target_language_cd","lang_language_cd" );
	}

	function locale() {
		return belongsTo ( "Locale","rsb_locale_cd","glob_locale_cd" );
	}
	
}
