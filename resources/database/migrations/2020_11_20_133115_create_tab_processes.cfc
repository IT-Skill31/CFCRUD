component {
    
    function up( schema, query ) {
        schema.create( "tab_processes", function(table) {
			table.string( "pro_process_cd", 50 );
			table.primaryKey( "pro_process_cd", "pk_tab_processes" );
            table.string("pro_dictionary_key", 200);
            table.string("pro_process_ds", 80);
            table.string("pro_process_icon", 50).nullable();
        } );

        // Bulk inserts
        query.from( "tab_processes" )
        .insert([ { 
            "pro_process_cd" = "AAA",
            "pro_dictionary_key" = "HOME_BASE",
            "pro_process_ds" = "HOME,EVENTS AND NOTIFICATIONS",
            "pro_process_icon" = "fontello-home-outline"
            },
            { 
            "pro_process_cd" = "ACC",
            "pro_dictionary_key" = "ACCOUNTING",
            "pro_process_ds" = "ACCOUNTING AND FINANCIALS",
            "pro_process_icon" = "fontello-money"
            },
            { 
            "pro_process_cd" = "ADM",
            "pro_dictionary_key" = "ADMINISTRATION",
            "pro_process_ds" = "PLATFORM AREA ADMINISTRATION",
            "pro_process_icon" = "fontello-box"
            },
            { 
            "pro_process_cd" = "BUY",
            "pro_dictionary_key" = "PROCUREMENT",
            "pro_process_ds" = "PROCUREMENT, SOURCING AND PURCHASING",
            "pro_process_icon" = "fontello-loop-alt"
            },
            { 
            "pro_process_cd" = "CRM",
            "pro_dictionary_key" = "SALES",
            "pro_process_ds" = "ACCOUNTS AND CONTACT MANAGEMENT",
            "pro_process_icon" = "fontello-phone-outline"
            },
            { 
            "pro_process_cd" = "HELP",
            "pro_dictionary_key" = "SUPPORT",
            "pro_process_ds" = "SUPPORT AND CUSTOMER SERVICE",
            "pro_process_icon" = "fontello-headphones"
            },
            { 
            "pro_process_cd" = "HRM",
            "pro_dictionary_key" = "PERSONNEL",
            "pro_process_ds" = "HUMAN RESOURCES MANAGEMENT",
            "pro_process_icon" = "fontello-users-outline"
            },
            { 
            "pro_process_cd" = "LOG",
            "pro_dictionary_key" = "LOGISTICS",
            "pro_process_ds" = "LOGISTICS AND SHIPMENT EXECUTION",
            "pro_process_icon" = "fontello-truck"
            },
            { 
            "pro_process_cd" = "PROD",
            "pro_dictionary_key" = "PRODUCTION",
            "pro_process_ds" = "PRODUCTION",
            "pro_process_icon" = "fontello-cog-1"
            },
            { 
            "pro_process_cd" = "SELL",
            "pro_dictionary_key" = "DISTRIBUTION",
            "pro_process_ds" = "SALES AND DISTRIBUTION",
            "pro_process_icon" = "fontello-warehouse"
            },
            { 
            "pro_process_cd" = "STOCK",
            "pro_dictionary_key" = "INVENTORY",
            "pro_process_ds" = "INVENTORY MANAGEMENT",
            "pro_process_icon" = "fontello-shop-1"
            },
            { 
            "pro_process_cd" = "STORE",
            "pro_dictionary_key" = "RETAIL",
            "pro_process_ds" = "RETAIL OPERATIONS",
            "pro_process_icon" = "fontello-grocery-store"
            },
            { 
            "pro_process_cd" = "TSL",
            "pro_dictionary_key" = "TRANSLATION",
            "pro_process_ds" = "TRANSLATION SERVICES",
            "pro_process_icon" = "fontello-globe-1"
            }   
            
        ]);
        
    }

    function down( schema, query ) {
        schema.dropIfExists( "tab_processes" );
    }

}

