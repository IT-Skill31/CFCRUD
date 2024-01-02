component {
    
    function up( schema, query ) {
        schema.create( "tab_profile_scopes", function(table) {
			table.increments( "psc_scope_id" );
			table.string( "psc_scope_nm", 50 );
            table.string( "psc_scope_type", 10 );
            table.string( "psc_scope_context", 15 );
            table.unique([ "psc_scope_type","psc_scope_context" ], "idx_scope_typecontext");
			table.string( "psc_scope_ds", 80 ).nullable();
		} );

        // Bulk inserts
        query.from( "tab_profile_scopes" )
        .insert([ { 
            "psc_scope_nm" = "AS SUPPLIER (TRADE)",
            "psc_scope_type" = "TRADE",
            "psc_scope_context" = "SUPPLIER",
            "psc_scope_ds" = "ACT AS SUPPLIER IN THE CONTEXT OF TRADE"
            },
            { 
            "psc_scope_nm" = "AS SUPPLIER (SERVICE)",
            "psc_scope_type" = "SERVICE",
            "psc_scope_context" = "SUPPLIER",
            "psc_scope_ds" = "ACT AS SUPPLIER IN THE CONTEXT OF SERVICE"
            },
            { 
            "psc_scope_nm" = "AS 3PL ORIGIN WAREHOUSE (SERVICE)",
            "psc_scope_type" = "SERVICE",
            "psc_scope_context" = "WHORIGIN",
            "psc_scope_ds" = "ACT AS 3PL OPERATED WAREHOUSE AT ORIGIN IN THE CONTEXT OF SERVICE"
            },
            { 
            "psc_scope_nm" = "AS 3PL DESTINATION WAREHOUSE (SERVICE)",
            "psc_scope_type" = "SERVICE",
            "psc_scope_context" = "WHDESTINATION",
            "psc_scope_ds" = "ACT AS 3PL OPERATED WAREHOUSE AT DESTINATION IN THE CONTEXT OF SERVICE"
            },
            { 
            "psc_scope_nm" = "AS ORIGIN WAREHOUSE (TRADE)",
            "psc_scope_type" = "TRADE",
            "psc_scope_context" = "WHORIGIN",
            "psc_scope_ds" = "ACT AS A PLANT OR WAREHOUSE AT ORIGIN IN THE CONTEXT OF TRADE"
            },
            { 
            "psc_scope_nm" = "AS DESTINATION WAREHOUSE (TRADE)",
            "psc_scope_type" = "TRADE",
            "psc_scope_context" = "WHDESTINATION",
            "psc_scope_ds" = "ACT AS A PLANT OR WAREHOUSE AT DESTINATION IN THE CONTEXT OF TRADE"
            },
            { 
            "psc_scope_nm" = "AS 3PL ORIGIN AGENT (SERVICE)",
            "psc_scope_type" = "SERVICE",
            "psc_scope_context" = "LOGORIGIN",
            "psc_scope_ds" = "ACT AS A 3PL AGENT AT ORIGIN IN THE CONTEXT OF SERVICE"
            },
            { 
            "psc_scope_nm" = "AS 3PL DESTINATION AGENT (SERVICE)",
            "psc_scope_type" = "SERVICE",
            "psc_scope_context" = "LOGDESTINATION",
            "psc_scope_ds" = "ACT AS A 3PL AGENT AT DESTINATION IN THE CONTEXT OF SERVICE"
            },
            { 
            "psc_scope_nm" = "AS BUYER (TRADE)",
            "psc_scope_type" = "TRADE",
            "psc_scope_context" = "BUYER",
            "psc_scope_ds" = "ACT AS BUYER IN THE CONTEXT OF TRADE"
            },
            { 
            "psc_scope_nm" = "AS BUYER (SERVICE)",
            "psc_scope_type" = "SERVICE",
            "psc_scope_context" = "BUYER",
            "psc_scope_ds" = "ACT AS BUYER IN THE CONTEXT OF SERVICE"
            },
            { 
            "psc_scope_nm" = "AS SUPPLY CHAIN LEAD (TRADE)",
            "psc_scope_type" = "TRADE",
            "psc_scope_context" = "PRINCIPAL",
            "psc_scope_ds" = "ACT AS SUPPLY CHAIN LEAD (PRINCIPAL) IN THE CONTEXT OF TRADE"
            },
            { 
            "psc_scope_nm" = "AS SUPPLY CHAIN LEAD (SERVICE)",
            "psc_scope_type" = "SERVICE",
            "psc_scope_context" = "4PL",
            "psc_scope_ds" = "ACT AS SUPPLY CHAIN LEAD (4PL) IN THE CONTEXT OF SERVICE"
            },
            { 
            "psc_scope_nm" = "AS EXTRANET TENANT",
            "psc_scope_type" = "ANY",
            "psc_scope_context" = "TENANT",
            "psc_scope_ds" = "ACT AS EXTRANET COMMUNITY TENANT IN ANY CONTEXT"
            },
            { 
            "psc_scope_nm" = "AS MULTI-TENANT OPERATOR",
            "psc_scope_type" = "ANY",
            "psc_scope_context" = "PLATFORM",
            "psc_scope_ds" = "ACT AS MULTI-TENANT PLATFORM OPERATOR IN ANY CONTEXT"
            }
                 
        ]);             
        
    }

    function down( schema, query ) {
        schema.dropIfExists( "tab_profile_scopes" );
    }

}

