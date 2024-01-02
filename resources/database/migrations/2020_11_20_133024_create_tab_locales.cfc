component {
    
    function up( schema, query ) {
        schema.create( "tab_locales", function(table) {
			table.string( "glob_locale_cd", 50 );
			table.primaryKey( "glob_locale_cd", "pk_tab_locales" );
            table.string("glob_language_cd", 2);
            table.index("glob_language_cd", "idx_language_cd");
            table.string("glob_locale_nm", 50);
            table.string("glob_calendar_lang", 7).default("en");
            table.boolean( "glob_is_gregorian_calendar").default( 1 );

        } );

        // Bulk inserts
        query.from( "tab_locales" )
        .insert([ { 
            "glob_locale_cd" = "ar_AE",
            "glob_language_cd" = "AR",
            "glob_locale_nm" = "ARABIC (UAE)",
            "glob_calendar_lang" = "ar",
            "glob_is_gregorian_calendar" = 1
            },
            {
            "glob_locale_cd" = "en_SG",
            "glob_language_cd" = "EN",
            "glob_locale_nm" = "ENGLISH (SINGAPORE)",
            "glob_calendar_lang" = "en",
            "glob_is_gregorian_calendar" = 1    
            },
            {
            "glob_locale_cd" = "en_US",
            "glob_language_cd" = "EN",
            "glob_locale_nm" = "ENGLISH (UNITED STATES)",
            "glob_calendar_lang" = "en",
            "glob_is_gregorian_calendar" = 1    
            },
            {
            "glob_locale_cd" = "fr_CA",
            "glob_language_cd" = "FR",
            "glob_locale_nm" = "FRENCH (CANADA)",
            "glob_calendar_lang" = "fr-ca",
            "glob_is_gregorian_calendar" = 1    
            },
            {
            "glob_locale_cd" = "fr_FR",
            "glob_language_cd" = "FR",
            "glob_locale_nm" = "FRENCH (FRANCE)",
            "glob_calendar_lang" = "fr",
            "glob_is_gregorian_calendar" = 1    
            },
            {
            "glob_locale_cd" = "ja_JP",
            "glob_language_cd" = "JA",
            "glob_locale_nm" = "JAPANESE (JAPAN)",
            "glob_calendar_lang" = "ja",
            "glob_is_gregorian_calendar" = 1    
            },
            {
            "glob_locale_cd" = "ko_KR",
            "glob_language_cd" = "KO",
            "glob_locale_nm" = "KOREAN (KOREA)",
            "glob_calendar_lang" = "ko",
            "glob_is_gregorian_calendar" = 1    
            },
            {
            "glob_locale_cd" = "th_TH",
            "glob_language_cd" = "TH",
            "glob_locale_nm" = "THAI (THAILAND)",
            "glob_calendar_lang" = "th",
            "glob_is_gregorian_calendar" = 0    
            },
            {
            "glob_locale_cd" = "zh_SG",
            "glob_language_cd" = "ZH",
            "glob_locale_nm" = "CHINESE (SINGAPORE)",
            "glob_calendar_lang" = "zh-cn",
            "glob_is_gregorian_calendar" = 1
            }
        ]);

    }

    function down( schema, query ) {
        schema.dropIfExists( "tab_locales" );
    }

}

