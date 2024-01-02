component {
    
    function up( schema, query ) {
        schema.create( "tab_roles", function(table) {
			table.string( "rol_role_nm", 50 );
			table.primaryKey( "rol_role_nm", "pk_tab_roles" );
            table.string("rol_role_ds", 80);
        } );

        // Bulk inserts
        query.from( "tab_roles" )
        .insert([ { 
            "rol_role_nm" = "APPROVE",
            "rol_role_ds" = "APPROVE WITHIN THE PROFILE SCOPE"
            },
            { 
            "rol_role_nm" = "CONTRIBUTE",
            "rol_role_ds" = "CONTRIBUTE WITHIN THE PROFILE SCOPE"
            },
            { 
            "rol_role_nm" = "MANAGE",
            "rol_role_ds" = "MANAGE WITHIN THE PROFILE SCOPE"
            },
            { 
            "rol_role_nm" = "VIEW",
            "rol_role_ds" = "VIEW WITHIN THE PROFILE SCOPE"
            },
            { 
            "rol_role_nm" = "AUDIT",
            "rol_role_ds" = "AUDIT OR ANALYZE WITHIN THE PROFILE SCOPE"
            }
            
        ]);
        
    }

    function down( schema, query ) {
        schema.dropIfExists( "tab_roles" );
    }

}

