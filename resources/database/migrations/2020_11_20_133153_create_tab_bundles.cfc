component {
    
    function up( schema, query ) {
        schema.create( "tab_bundles", function(table) {
			table.string( "bun_bundle_cd", 50 );
			table.primaryKey( "bun_bundle_cd", "pk_tab_bundles" );
            table.string("bun_bundle_nm", 50);
            table.string("bun_extranet_nm", 50);
        } );

        // Bulk inserts
        query.from( "tab_bundles" )
        .insert([ { 
            "bun_bundle_cd" = "MenuRB",
            "bun_bundle_nm" = "MENU TRANSLATION",
            "bun_extranet_nm" = "GLOBAL-G2G"
            },
            { 
            "bun_bundle_cd" = "ParamRB",
            "bun_bundle_nm" = "PARAMETERS TRANSLATION",
            "bun_extranet_nm" = "GLOBAL-G2G"
            },
            { 
            "bun_bundle_cd" = "ScreenRB",
            "bun_bundle_nm" = "SCREEN TRANSLATION",
            "bun_extranet_nm" = "GLOBAL-G2G"    
            }
              
        ]);
        
    }

    function down( schema, query ) {
        schema.dropIfExists( "tab_bundles" );
    }

}

