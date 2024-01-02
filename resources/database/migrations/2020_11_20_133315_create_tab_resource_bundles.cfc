component {
    
    function up( schema, query ) {
        schema.create( "tab_resource_bundles", function(table) {
			table.string( "rsb_rbundle_nm", 50 );
			table.primaryKey( "rsb_rbundle_nm", "pk_tab_resource_bundles" );
            table.string("rsb_rbundle_cd", 50);
            table.string("rsb_locale_cd", 50);
            table.string("rsb_target_language_cd", 2);
            table.string("rsb_comment", 80);
        } );

        // Bulk inserts
        query.from( "tab_resource_bundles" )
        .insert([ { 
            "rsb_rbundle_nm" = "MenuRB_ar_AE",
            "rsb_rbundle_cd" = "MenuRB",
            "rsb_locale_cd" = "ar_AE",
            "rsb_target_language_cd" = "AR",
            "rsb_comment" = "MENU BUNDLES IN ARABIC (UAE)"
            },
            { 
            "rsb_rbundle_nm" = "ParamRB_ar_AE",
            "rsb_rbundle_cd" = "ParamRB",
            "rsb_locale_cd" = "ar_AE",
            "rsb_target_language_cd" = "AR",
            "rsb_comment" = "PARAMETERS BUNDLES IN ARABIC (UAE)"
            },
            {
            "rsb_rbundle_nm" = "ScreenRB_ar_AE",
            "rsb_rbundle_cd" = "ScreenRB",
            "rsb_locale_cd" = "ar_AE",
            "rsb_target_language_cd" = "AR",
            "rsb_comment" = "SCREENS BUNDLES IN ARABIC (UAE)"
            },
            { 
            "rsb_rbundle_nm" = "MenuRB_en_SG",
            "rsb_rbundle_cd" = "MenuRB",
            "rsb_locale_cd" = "en_SG",
            "rsb_target_language_cd" = "EN",
            "rsb_comment" = "MENU BUNDLES IN ENGLISH (SINGAPORE)"
            },
            { 
            "rsb_rbundle_nm" = "ParamRB_en_SG",
            "rsb_rbundle_cd" = "ParamRB",
            "rsb_locale_cd" = "en_SG",
            "rsb_target_language_cd" = "EN",
            "rsb_comment" = "PARAMETERS BUNDLES IN ENGLISH (SINGAPORE)"
            },
            { 
            "rsb_rbundle_nm" = "ScreenRB_en_SG",
            "rsb_rbundle_cd" = "ScreenRB",
            "rsb_locale_cd" = "en_SG",
            "rsb_target_language_cd" = "EN",
            "rsb_comment" = "SCREENS BUNDLES IN ENGLISH (SINGAPORE)"
            },
            { 
            "rsb_rbundle_nm" = "MenuRB_en_US",
            "rsb_rbundle_cd" = "MenuRB",
            "rsb_locale_cd" = "en_US",
            "rsb_target_language_cd" = "EN",
            "rsb_comment" = "MENU BUNDLES IN ENGLISH (USA)"
            },
            { 
            "rsb_rbundle_nm" = "ParamRB_en_US",
            "rsb_rbundle_cd" = "ParamRB",
            "rsb_locale_cd" = "en_US",
            "rsb_target_language_cd" = "EN",
            "rsb_comment" = "PARAMETERS BUNDLES IN ENGLISH (USA)"
            },
            { 
            "rsb_rbundle_nm" = "ScreenRB_en_US",
            "rsb_rbundle_cd" = "ScreenRB",
            "rsb_locale_cd" = "en_US",
            "rsb_target_language_cd" = "EN",
            "rsb_comment" = "SCREENS BUNDLES IN ENGLISH (USA)"
            },
            { 
            "rsb_rbundle_nm" = "MenuRB_fr_CA",
            "rsb_rbundle_cd" = "MenuRB",
            "rsb_locale_cd" = "fr_CA",
            "rsb_target_language_cd" = "FR",
            "rsb_comment" = "MENU BUNDLES IN FRENCH (CANADA)"
            },
            { 
            "rsb_rbundle_nm" = "ParamRB_fr_CA",
            "rsb_rbundle_cd" = "ParamRB",
            "rsb_locale_cd" = "fr_CA",
            "rsb_target_language_cd" = "FR",
            "rsb_comment" = "PARAMETERS BUNDLES IN FRENCH (CANADA)"
            },
            { 
            "rsb_rbundle_nm" = "ScreenRB_fr_CA",
            "rsb_rbundle_cd" = "ScreenRB",
            "rsb_locale_cd" = "fr_CA",
            "rsb_target_language_cd" = "FR",
            "rsb_comment" = "SCREENS BUNDLES IN FRENCH (CANADA)"
            },
            { 
            "rsb_rbundle_nm" = "MenuRB_fr_FR",
            "rsb_rbundle_cd" = "MenuRB",
            "rsb_locale_cd" = "fr_FR",
            "rsb_target_language_cd" = "FR",
            "rsb_comment" = "MENU BUNDLES IN FRENCH (FRANCE)"
            },
            { 
            "rsb_rbundle_nm" = "ParamRB_fr_FR",
            "rsb_rbundle_cd" = "ParamRB",
            "rsb_locale_cd" = "fr_FR",
            "rsb_target_language_cd" = "FR",
            "rsb_comment" = "PARAMETERS BUNDLES IN FRENCH (FRANCE)"
            },
            { 
            "rsb_rbundle_nm" = "ScreenRB_fr_FR",
            "rsb_rbundle_cd" = "ScreenRB",
            "rsb_locale_cd" = "fr_FR",
            "rsb_target_language_cd" = "FR",
            "rsb_comment" = "SCREENS BUNDLES IN FRENCH (FRANCE)"
            },
            { 
            "rsb_rbundle_nm" = "MenuRB_ja_JP",
            "rsb_rbundle_cd" = "MenuRB",
            "rsb_locale_cd" = "ja_JP",
            "rsb_target_language_cd" = "JA",
            "rsb_comment" = "MENU BUNDLES IN JAPANESE"
            },
            { 
            "rsb_rbundle_nm" = "ParamRB_ja_JP",
            "rsb_rbundle_cd" = "ParamRB",
            "rsb_locale_cd" = "ja_JP",
            "rsb_target_language_cd" = "JA",
            "rsb_comment" = "PARAMETERS BUNDLES IN JAPANESE"
            },
            { 
            "rsb_rbundle_nm" = "ScreenRB_ja_JP",
            "rsb_rbundle_cd" = "ScreenRB",
            "rsb_locale_cd" = "ja_JP",
            "rsb_target_language_cd" = "JA",
            "rsb_comment" = "SCREENS BUNDLES IN JAPANESE"
            },
            { 
            "rsb_rbundle_nm" = "MenuRB_ko_KR",
            "rsb_rbundle_cd" = "MenuRB",
            "rsb_locale_cd" = "ko_KR",
            "rsb_target_language_cd" = "KO",
            "rsb_comment" = "MENU BUNDLES IN KOREAN"
            },
            { 
            "rsb_rbundle_nm" = "ParamRB_ko_KR",
            "rsb_rbundle_cd" = "ParamRB",
            "rsb_locale_cd" = "ko_KR",
            "rsb_target_language_cd" = "KO",
            "rsb_comment" = "PARAMETERS BUNDLES IN KOREAN"
            },
            { 
            "rsb_rbundle_nm" = "ScreenRB_ko_KR",
            "rsb_rbundle_cd" = "ScreenRB",
            "rsb_locale_cd" = "ko_KR",
            "rsb_target_language_cd" = "KO",
            "rsb_comment" = "SCREENS BUNDLES IN KOREAN"
            },
            { 
            "rsb_rbundle_nm" = "MenuRB_th_TH",
            "rsb_rbundle_cd" = "MenuRB",
            "rsb_locale_cd" = "th_TH",
            "rsb_target_language_cd" = "TH",
            "rsb_comment" = "MENU BUNDLES IN THAI"
            },
            { 
            "rsb_rbundle_nm" = "ParamRB_th_TH",
            "rsb_rbundle_cd" = "ParamRB",
            "rsb_locale_cd" = "th_TH",
            "rsb_target_language_cd" = "TH",
            "rsb_comment" = "PARAMETERS BUNDLES IN THAI"
            },
            { 
            "rsb_rbundle_nm" = "ScreenRB_th_TH",
            "rsb_rbundle_cd" = "ScreenRB",
            "rsb_locale_cd" = "th_TH",
            "rsb_target_language_cd" = "TH",
            "rsb_comment" = "SCREENS BUNDLES IN THAI"
            },
            { 
            "rsb_rbundle_nm" = "MenuRB_zh_SG",
            "rsb_rbundle_cd" = "MenuRB",
            "rsb_locale_cd" = "zh_SG",
            "rsb_target_language_cd" = "ZH",
            "rsb_comment" = "MENU BUNDLES IN CHINESE (SINGAPORE)"
            },
            { 
            "rsb_rbundle_nm" = "ParamRB_zh_SG",
            "rsb_rbundle_cd" = "ParamRB",
            "rsb_locale_cd" = "zh_SG",
            "rsb_target_language_cd" = "ZH",
            "rsb_comment" = "PARAMETERS BUNDLES IN CHINESE (SINGAPORE)"
            },
            { 
            "rsb_rbundle_nm" = "ScreenRB_zh_SG",
            "rsb_rbundle_cd" = "ScreenRB",
            "rsb_locale_cd" = "zh_SG",
            "rsb_target_language_cd" = "ZH",
            "rsb_comment" = "SCREENS BUNDLES IN CHINESE (SINGAPORE)"
            }
              
        ]);
        
    }

    function down( schema, query ) {
        schema.dropIfExists( "tab_resource_bundles" );
    }

}

