component table="tab_locales" extends="quick.models.BaseEntity" accessors="true" {

	property name="localeCD" column="glob_locale_cd";
	property name="localeLanguageCD" column="glob_language_cd";
	property name="localeName" column="glob_locale_nm";
	property name="calendarLang" column="glob_calendar_lang";
	property name="isGregorianCalendar" column="glob_is_gregorian_calendar";

	variables._key = "localeCD";

	function keyType() {
        return variables._wirebox.getInstance( "NullKeyType@quick" );
    }

	// Relationships

	function users() {
       return hasMany( "User" );
    }

	function resourceBundles() {
       return hasMany( "ResourceBundle" );
    }

	function language() {
		return belongsTo ( "Language","glob_language_cd","lang_language_cd" );
	}
	
}
