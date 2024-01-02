component {
    
    function up( schema, query ) {

        schema.alter( "tab_user_accounts", function( table ) {
        table.addConstraint( table.foreignKey( "usrla_locale_cd" )
                             .references("glob_locale_cd")
                             .onTable("tab_locales")
                             .onDelete("RESTRICT") );
        } );

        schema.alter( "tab_locales", function( table ) {
        table.addConstraint( table.foreignKey( "glob_language_cd" )
                             .references("lang_language_cd")
                             .onTable("tab_languages")
                             .onDelete("RESTRICT") );
        } );

        schema.alter( "tab_user_profiles", function( table ) {
        table.addConstraint( table.foreignKey( "usrprf_login_id" )
                             .references("id")
                             .onTable("tab_user_accounts")
                             .onDelete("CASCADE") );
        table.addConstraint( table.foreignKey( "usrprf_profile_id" )
                             .references("prf_profile_id")
                             .onTable("tab_profiles")
                             .onDelete("CASCADE") );                    
        } );

        schema.alter( "tab_profiles", function( table ) {
        table.addConstraint( table.foreignKey( "prf_role_nm" )
                             .references("rol_role_nm")
                             .onTable("tab_roles")
                             .onDelete("RESTRICT") );
        table.addConstraint( table.foreignKey( "prf_scope_id" )
                             .references("psc_scope_id")
                             .onTable("tab_profile_scopes")
                             .onDelete("RESTRICT") );
        table.addConstraint( table.foreignKey( "prf_process_cd" )
                             .references("pro_process_cd")
                             .onTable("tab_processes")
                             .onDelete("RESTRICT") );                                         
        } );

        schema.alter( "tab_processes", function( table ) {
        table.addConstraint( table.foreignKey( "pro_dictionary_key" )
                             .references("dix_dictionary_key")
                             .onTable("tab_dictionary_keys")
                             .onDelete("RESTRICT")
                             .onUpdate("RESTRICT") );
        } );

        schema.alter( "tab_translations", function( table ) {
        table.addConstraint( table.foreignKey( "tsl_dictionary_key" )
                             .references("dix_dictionary_key")
                             .onTable("tab_dictionary_keys")
                             .onDelete("CASCADE") 
                             .onUpdate("RESTRICT"));
        table.addConstraint( table.foreignKey( "tsl_bundle_nm" )
                             .references("rsb_rbundle_nm")
                             .onTable("tab_resource_bundles")
                             .onDelete("RESTRICT") 
                             .onUpdate("RESTRICT"));                     
        } );

        schema.alter( "tab_dictionary_keys", function( table ) {
        table.addConstraint( table.foreignKey( "dix_group_id" )
                             .references("dgr_group_id")
                             .onTable("tab_dictionary_groups")
                             .onDelete("RESTRICT") 
                             .onUpdate("RESTRICT"));
        table.addConstraint( table.foreignKey( "dix_bundle_cd" )
                             .references("bun_bundle_cd")
                             .onTable("tab_bundles")
                             .onDelete("RESTRICT") 
                             .onUpdate("RESTRICT"));
        table.addConstraint( table.foreignKey( "dix_source_language_cd" )
                             .references("lang_language_cd")
                             .onTable("tab_languages")
                             .onDelete("RESTRICT") 
                             .onUpdate("RESTRICT"));                                         
        } );

        schema.alter( "tab_resource_bundles", function( table ) {
        table.addConstraint( table.foreignKey( "rsb_rbundle_cd" )
                             .references("bun_bundle_cd")
                             .onTable("tab_bundles")
                             .onDelete("RESTRICT") 
                             .onUpdate("RESTRICT"));
        table.addConstraint( table.foreignKey( "rsb_target_language_cd" )
                             .references("lang_language_cd")
                             .onTable("tab_languages")
                             .onDelete("RESTRICT") 
                             .onUpdate("RESTRICT"));
        table.addConstraint( table.foreignKey( "rsb_locale_cd" )
                             .references("glob_locale_cd")
                             .onTable("tab_locales")
                             .onDelete("RESTRICT") 
                             .onUpdate("RESTRICT"));                                         
        } );

        
    }

    function down( schema, query ) {

        // Always delete the child table before the parent table
        
        schema.drop( "tab_user_profiles" );
        schema.drop( "tab_user_accounts" );
        schema.drop( "tab_profiles" );
        schema.drop( "tab_processes" );
        schema.drop( "tab_translations" );
        schema.drop( "tab_dictionary_keys" );
        schema.drop( "tab_resource_bundles" );
        schema.drop( "tab_locales" );    
    }

}

