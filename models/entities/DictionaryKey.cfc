component table="tab_dictionary_keys" extends="quick.models.BaseEntity" accessors="true" {

	property name="dictionaryKeyString" column="dix_dictionary_key" ;
	property name="dictionaryKeyBundleCD" column="dix_bundle_cd" ;
	property name="dictionaryKeySourceLanguageCD" column="dix_source_language_cd" ;
	property name="dictionaryKeyGroupID" column="dix_group_id" ;
	property name="dictionaryKeySourceTranslation" column="dix_source_translation" ;
	property name="dictionaryUIKey" column="dix_translation_key" ;
	
	variables._key = "dictionaryKeyString";

	function keyType() {
        return variables._wirebox.getInstance( "NullKeyType@quick" );
    }

	// Relationships

	function processes() {
       return hasMany( "Process" );
    }

	function translations() {
       return hasMany( "Translation" );
    }

	function dictionaryGroup() {
		return belongsTo ( "DictionaryGroup","dix_group_id","dgr_group_id" );
	}

	function bundle() {
		return belongsTo ( "Bundle","dix_bundle_cd","bun_bundle_cd" );
	}

	function language() {
		return belongsTo ( "Language","dix_source_language_cd","lang_language_cd" );
	}

	// Other methods

	public array function availableKeys(myArray, groupID) {	

		var aKeys = _wirebox.getInstance("DictionaryKey")
		.where( function(q) {
			q.where("dictionaryKeyGroupID", "=", groupID)
			.whereNotIn("dictionaryKeyString", myArray)
			}) 
		.get();	 	

		return aKeys;

	}

	public array function keysWithoutTranslation(bundleCD, myArray) {

		var aKeys = _wirebox.getInstance( "DictionaryKey" )
		//.retrieveQuery()
		.where( function(q) {
			q.where("dictionaryKeyBundleCD", bundleCD)
			.whereNotIn("dictionaryKeyString", myArray)
			})  	
		.get();

		return akeys;

	}
	
}
