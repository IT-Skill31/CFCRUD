component {
    
    function up( schema, query ) {
         schema.create( "tab_user_profiles", function(table) {
			table.unsignedInteger( "usrprf_login_id" );
            table.unsignedInteger( "usrprf_profile_id" );
            table.primaryKey(["usrprf_login_id", "usrprf_profile_id"], "pk_tab_user_profiles");
            table.unsignedInteger("usrprf_workgroup_id");
			table.boolean( "usrprf_profile_ok").default( 1 );
		} );
        
    }

    function down( schema, query ) {
        schema.dropIfExists( "tab_user_profiles" );
    }

}

