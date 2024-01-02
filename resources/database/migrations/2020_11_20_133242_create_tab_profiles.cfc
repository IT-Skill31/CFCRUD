component {
    
    function up( schema, query ) {
       schema.create( "tab_profiles", function(table) {
			table.increments( "prf_profile_id" );
			table.string( "prf_process_cd", 50 );
            table.string( "prf_role_nm", 50 );
            table.unsignedInteger("prf_scope_id");
            table.unique([ "prf_process_cd", "prf_role_nm", "prf_scope_id" ], "idx_profile_proscope");
            table.string( "prf_profile_nm", 50 );
			table.string( "prf_profile_ds", 80 ).nullable();
		} );

        // Bulk inserts
        query.from( "tab_profiles" )
        .insert([ { 
            "prf_process_cd" = "AAA",
            "prf_role_nm" = "MANAGE",
            "prf_scope_id" = 13,
            "prf_profile_nm" = "DEFAULT PROFILE (AS TENANT USER)",
            "prf_profile_ds" = "MANAGE MY USER HOME"
            },
            { 
            "prf_process_cd" = "ADM",
            "prf_role_nm" = "MANAGE",
            "prf_scope_id" = 14,
            "prf_profile_nm" = "ADMIN MANAGE (AS PLATFORM OPERATOR)",
            "prf_profile_ds" = "ACT AS ADMINISTRATOR ACROSS PLATFORM"
            },
            { 
            "prf_process_cd" = "ADM",
            "prf_role_nm" = "CONTRIBUTE",
            "prf_scope_id" = 13,
            "prf_profile_nm" = "ADMIN CONTRIBUTE (AS TENANT USER)",
            "prf_profile_ds" = "ACT AS DELEGATED TENANT ADMINISTRATOR"
            },
            { 
            "prf_process_cd" = "ADM",
            "prf_role_nm" = "MANAGE",
            "prf_scope_id" = 13,
            "prf_profile_nm" = "ADMIN MANAGE (AS TENANT USER)",
            "prf_profile_ds" = "ACT AS MAIN TENANT ADMINISTRATOR"
            },
            { 
            "prf_process_cd" = "STORE",
            "prf_role_nm" = "APPROVE",
            "prf_scope_id" = 13,
            "prf_profile_nm" = "RETAIL OUTLET APPROVE (AS TENANT USER)",
            "prf_profile_ds" = "ACT AS RETAIL INTERNAL OR EXTERNAL USER WITH APPROVAL ROLE"
            },
            { 
            "prf_process_cd" = "STORE",
            "prf_role_nm" = "MANAGE",
            "prf_scope_id" = 13,
            "prf_profile_nm" = "RETAIL OUTLET MANAGE (AS TENANT USER)",
            "prf_profile_ds" = "ACT AS RETAIL STORE MANAGER"
            },
            { 
            "prf_process_cd" = "STORE",
            "prf_role_nm" = "CONTRIBUTE",
            "prf_scope_id" = 13,
            "prf_profile_nm" = "RETAIL OUTLET CONTRIBUTE (AS TENANT USER)",
            "prf_profile_ds" = "ACT AS RETAIL STORE ASSISTANT"
            },
            { 
            "prf_process_cd" = "STOCK",
            "prf_role_nm" = "AUDIT",
            "prf_scope_id" = 13,
            "prf_profile_nm" = "STOCK REVIEW / ENQUIRY (AS TENANT USER)",
            "prf_profile_ds" = "ACT AS INTERNAL OR EXTERNAL USER REVIEWING STOCK SITUATION"
            },
            { 
            "prf_process_cd" = "HRM",
            "prf_role_nm" = "APPROVE",
            "prf_scope_id" = 13,
            "prf_profile_nm" = "RECRUITMENT-APPROVE (AS TENANT USER)",
            "prf_profile_ds" = "ACT AS INTERNAL OR EXTERNAL USER WITH RECRUITMENT APPROVAL"
            },
            { 
            "prf_process_cd" = "TSL",
            "prf_role_nm" = "APPROVE",
            "prf_scope_id" = 13,
            "prf_profile_nm" = "TRANSLATION APPROVE (AS TENANT USER)",
            "prf_profile_ds" = "ACT AS INTERNAL OR EXTERNAL USER WITH TRANSLATION REVIEW AND APPROVAL"
            },
            { 
            "prf_process_cd" = "TSL",
            "prf_role_nm" = "CONTRIBUTE",
            "prf_scope_id" = 13,
            "prf_profile_nm" = "TRANSLATION CONTRIBUTE (AS TENANT USER)",
            "prf_profile_ds" = "ACT AS INTERNAL OR EXTERNAL TRANSLATION CONTRIBUTOR"
            }
                 
        ]); 


    }

    function down( schema, query ) {
       schema.dropIfExists( "tab_profiles" ); 
    }

}

