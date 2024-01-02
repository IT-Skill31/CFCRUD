component {
    
    function up( schema, query ) {
        schema.create( "tab_dictionary_keys", function(table) {
			table.string( "dix_dictionary_key", 200 );
			table.primaryKey( "dix_dictionary_key", "pk_tab_dictionary_keys" );
            table.string("dix_bundle_cd", 50);
            table.string("dix_source_language_cd", 2);
            table.unsignedInteger("dix_group_id");
            table.string("dix_source_translation", 200);
            table.string("dix_translation_key", 80).unique();
        } );

        // Bulk inserts
        query.from( "tab_dictionary_keys" )
        .insert([ { 
            "dix_dictionary_key" = "HOME_BASE",
            "dix_bundle_cd" = "MenuRB",
            "dix_source_language_cd" = "EN",
            "dix_group_id" = 3,
            "dix_source_translation" = "my folder",
            "dix_translation_key" = "HomeBase"
            },
            { 
            "dix_dictionary_key" = "ACCOUNTING",
            "dix_bundle_cd" = "MenuRB",
            "dix_source_language_cd" = "EN",
            "dix_group_id" = 3,
            "dix_source_translation" = "accounting",
            "dix_translation_key" = "Accounting"  
            },
            { 
            "dix_dictionary_key" = "ADMINISTRATION",
            "dix_bundle_cd" = "MenuRB",
            "dix_source_language_cd" = "EN",
            "dix_group_id" = 3,
            "dix_source_translation" = "administration",
            "dix_translation_key" = "Administration" 
            },
            { 
            "dix_dictionary_key" = "PROCUREMENT",
            "dix_bundle_cd" = "MenuRB",
            "dix_source_language_cd" = "EN",
            "dix_group_id" = 3,
            "dix_source_translation" = "procurement",
            "dix_translation_key" = "Procurement"
            },
            { 
            "dix_dictionary_key" = "SALES",
            "dix_bundle_cd" = "MenuRB",
            "dix_source_language_cd" = "EN",
            "dix_group_id" = 3,
            "dix_source_translation" = "sales",
            "dix_translation_key" = "Sales"
            },
            { 
            "dix_dictionary_key" = "SUPPORT",
            "dix_bundle_cd" = "MenuRB",
            "dix_source_language_cd" = "EN",
            "dix_group_id" = 3,
            "dix_source_translation" = "support",
            "dix_translation_key" = "Support"
            },
            { 
            "dix_dictionary_key" = "PERSONNEL",
            "dix_bundle_cd" = "MenuRB",
            "dix_source_language_cd" = "EN",
            "dix_group_id" = 3,
            "dix_source_translation" = "personnel",
            "dix_translation_key" = "Personnel"
            },
            { 
            "dix_dictionary_key" = "LOGISTICS",
            "dix_bundle_cd" = "MenuRB",
            "dix_source_language_cd" = "EN",
            "dix_group_id" = 3,
            "dix_source_translation" = "logistics",
            "dix_translation_key" = "Logistics"
            },
            { 
            "dix_dictionary_key" = "PRODUCTION",
            "dix_bundle_cd" = "MenuRB",
            "dix_source_language_cd" = "EN",
            "dix_group_id" = 3,
            "dix_source_translation" = "production",
            "dix_translation_key" = "Production"
            },
            { 
            "dix_dictionary_key" = "DISTRIBUTION",
            "dix_bundle_cd" = "MenuRB",
            "dix_source_language_cd" = "EN",
            "dix_group_id" = 3,
            "dix_source_translation" = "distribution",
            "dix_translation_key" = "Distribution" 
            },
            { 
            "dix_dictionary_key" = "INVENTORY",
            "dix_bundle_cd" = "MenuRB",
            "dix_source_language_cd" = "EN",
            "dix_group_id" = 3,
            "dix_source_translation" = "inventory",
            "dix_translation_key" = "Inventory" 
            },
            { 
            "dix_dictionary_key" = "RETAIL",
            "dix_bundle_cd" = "MenuRB",
            "dix_source_language_cd" = "EN",
            "dix_group_id" = 3,
            "dix_source_translation" = "retail",
            "dix_translation_key" = "Retail" 
            },
            { 
            "dix_dictionary_key" = "TRANSLATION",
            "dix_bundle_cd" = "MenuRB",
            "dix_source_language_cd" = "EN",
            "dix_group_id" = 3,
            "dix_source_translation" = "translation",
            "dix_translation_key" = "Translation" 
            }   
            
        ]);
        
    }

    function down( schema, query ) {
        schema.dropIfExists( "tab_dictionary_keys" );
    }

}
