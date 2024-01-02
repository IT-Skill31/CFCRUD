component {
    
    function up( schema, query ) {
       schema.create( "tab_languages", function(table) {
			table.string( "lang_language_cd", 2 );
			table.primaryKey( "lang_language_cd", "pk_tab_languages" );
            table.string("lang_language_nm", 50).unique();
        } );

       // Bulk inserts
        query.from( "tab_languages" )
        .insert([ { 
            "lang_language_cd" = "AR",
            "lang_language_nm" = "ARABIC"
            },
            { 
            "lang_language_cd" = "ZH",
            "lang_language_nm" = "CHINESE"
            },
            { 
            "lang_language_cd" = "EN",
            "lang_language_nm" = "ENGLISH"
            },
            { 
            "lang_language_cd" = "FR",
            "lang_language_nm" = "FRENCH"
            },
            { 
            "lang_language_cd" = "JA",
            "lang_language_nm" = "JAPANESE"
            },
            { 
            "lang_language_cd" = "KO",
            "lang_language_nm" = "KOREAN"
            },
            { 
            "lang_language_cd" = "TH",
            "lang_language_nm" = "THAI"
            },
            { 
            "lang_language_cd" = "DE",
            "lang_language_nm" = "GERMAN"
            },
            { 
            "lang_language_cd" = "NL",
            "lang_language_nm" = "DUTCH"
            },
            { 
            "lang_language_cd" = "ES",
            "lang_language_nm" = "SPANISH"
            },
            { 
            "lang_language_cd" = "IT",
            "lang_language_nm" = "ITALIAN"
            },
            { 
            "lang_language_cd" = "RU",
            "lang_language_nm" = "RUSSIAN"
            },
            { 
            "lang_language_cd" = "ID",
            "lang_language_nm" = "BAHASA INDONESIA"
            },
            { 
            "lang_language_cd" = "VI",
            "lang_language_nm" = "VIETNAMESE"
            }              
        ]);

      
    }

    function down( schema, query ) {
        schema.dropIfExists( "tab_languages" );
    }

}

