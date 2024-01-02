component table="tab_languages" extends="quick.models.BaseEntity" accessors="true" {

	property name="languageCD" column="lang_language_cd" ;
	property name="languageName" column="lang_language_nm";

	variables._key = "languageCD";

	function keyType() {
        return variables._wirebox.getInstance( "NullKeyType@quick" );
    }

	// Relationships

	function locales() {
       return hasMany( "Locale" );
    }

	function resourceBundles() {
       return hasMany( "ResourceBundle" );
    }

	function dictionaryKeys() {
       return hasMany( "DictionaryKey" );
    }
	
}
