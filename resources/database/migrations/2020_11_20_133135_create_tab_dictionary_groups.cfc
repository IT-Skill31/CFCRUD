component {
    
    function up( schema, query ) {
        schema.create( "tab_dictionary_groups", function(table) {
			table.increments( "dgr_group_id" );
			table.string( "dgr_group_nm", 50 ).unique();
			table.string( "dgr_group_ds", 80 );
		} );

        // Bulk inserts
        query.from( "tab_dictionary_groups" )
        .insert([ { 
            "dgr_group_nm" = "NOGROUP",
            "dgr_group_ds" = "UNALLOCATED DICTIONARY KEYS"
            },
            { 
            "dgr_group_nm" = "MENU OPTIONS",
            "dgr_group_ds" = "MENU OPTIONS GROUP"
            },
            { 
            "dgr_group_nm" = "MENU APPLICATIONS",
            "dgr_group_ds" = "MENU APPLICATIONS GROUP"
            },
            { 
            "dgr_group_nm" = "MENU MODULES",
            "dgr_group_ds" = "MENU MODULES GROUP"
            },
            { 
            "dgr_group_nm" = "BUTTONS",
            "dgr_group_ds" = "BUTTONS GROUP"
            },
            { 
            "dgr_group_nm" = "LINKS",
            "dgr_group_ds" = "NAVIGATION LINKS AND MENU TITLES GROUP"
            },
            { 
            "dgr_group_nm" = "PROMPTS",
            "dgr_group_ds" = "MESSAGES AND PROMPTS GROUP"
            },
            { 
            "dgr_group_nm" = "REFERENCES",
            "dgr_group_ds" = "REFERENCES GROUP"
            },
            { 
            "dgr_group_nm" = "ACCESS SCOPE",
            "dgr_group_ds" = "ACCESS SCOPE GROUP"
            },
            { 
            "dgr_group_nm" = "ASSIGN PROFILES",
            "dgr_group_ds" = "ASSIGN PROFILES GROUP"
            },
            { 
            "dgr_group_nm" = "ACCESS CONTROL",
            "dgr_group_ds" = "ACCESS CONTROL GROUP"
            },
            { 
            "dgr_group_nm" = "HOME",
            "dgr_group_ds" = "HOME GROUP"
            },
            { 
            "dgr_group_nm" = "LOGIN",
            "dgr_group_ds" = "LOGIN FORM GROUP"
            },
            { 
            "dgr_group_nm" = "GLOBALIZATION",
            "dgr_group_ds" = "GLOBALIZATION GROUP"
            },
            { 
            "dgr_group_nm" = "NAVIGATION",
            "dgr_group_ds" = "NAVIGATION GROUP"
            },
            { 
            "dgr_group_nm" = "DICTIONARY",
            "dgr_group_ds" = "DICTIONARY KEYS GROUP"
            },
            { 
            "dgr_group_nm" = "RETAIL",
            "dgr_group_ds" = "RETAIL PARAMETERS GROUP"
            },
            { 
            "dgr_group_nm" = "COST OF GOODS",
            "dgr_group_ds" = "COSTING PARAMETERS GROUP"
            },
            { 
            "dgr_group_nm" = "COMPARATORS",
            "dgr_group_ds" = "COMPARISON PARAMETERS GROUP"
            },
            { 
            "dgr_group_nm" = "ERRORS",
            "dgr_group_ds" = "ERROR MESSAGES GROUP"
            },
            { 
            "dgr_group_nm" = "GREETINGS",
            "dgr_group_ds" = "GREETING AND PLACEHOLDER GROUP"
            },
            { 
            "dgr_group_nm" = "HELP",
            "dgr_group_ds" = "HELP PARAMETERS GROUP"
            },
            { 
            "dgr_group_nm" = "REPORTS",
            "dgr_group_ds" = "REPORTS PARAMETERS GROUP"
            },
            { 
            "dgr_group_nm" = "STATUS",
            "dgr_group_ds" = "STATUS PARAMETERS GROUP"
            },
            { 
            "dgr_group_nm" = "VIEW",
            "dgr_group_ds" = "VIEW PARAMETERS GROUP"
            }
                  
        ]);
        
    }

    function down( schema, query ) {
        schema.dropIfExists( "tab_dictionary_groups" );
    }

}

