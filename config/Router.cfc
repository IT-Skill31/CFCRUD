component {

	function configure(){
		
		// Set Full Rewrites
		setFullRewrites( true );

		route( "/login" ).withHandler( "sessions" ).toAction( { "GET" : "new", "POST" : "create" } );
		route( "/logout", "sessions.delete" );
		
		// get("/userprofiles/new", "Userprofiles.new" );
		
		// route("/userprofiles/:userLoginID/:userProfileID/edit").withHandler("UserProfiles").toAction( { "GET" : "edit" } );

		// route( "/userprofiles/:userLoginID/:userProfileID" )
		// .withAction( {
		// GET : "show",
		// PUT : "update",
		// DELETE : "delete",
		// } )
		// .toHandler( "userProfiles" );

		// route("/userprofiles").withHandler("UserProfiles").toAction( { "GET" : "index", "POST" : "create" } );

		// resources( resource = "processes", parameterName = "processCD" );
		resources( resource = "roles", parameterName = "roleName" );
		// resources( resource = "profileScopes", parameterName = "profileScopeID" );
		// resources( resource = "profiles", parameterName = "profileID" );
		resources( resource = "registrations", only = [ "new", "create" ] );

		// Conventions based routing
		route( ":handler/:action?" ).end();
	}

}
