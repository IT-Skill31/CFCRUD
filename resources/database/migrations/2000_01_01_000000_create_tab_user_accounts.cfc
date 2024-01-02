component {

	function up( schema, query ){
		schema.create( "tab_user_accounts", function(table) {
			table.increments( "id" );
			table.string( "usrla_email_login" ).unique();
			table.string( "usrla_password" );
			table.string( "usrla_email_notify", 60 );
			table.string( "usrla_nickname", 60 ).unique();
			table.string( "usrla_greetings", 4 ).default("MR");
			table.string( "usrla_firstname", 60 );
			table.string( "usrla_middlename", 60 ).nullable();
			table.string( "usrla_lastname", 60 );
			table.string( "usrla_locale_cd").default( "en_US" );
			table.boolean( "usrla_use_gregorian_calendar").default( 1 );
			table.string( "usrla_timezone", 80 ).default( "Asia/Singapore" );
			table.string( "usrla_date_display", 60 ).default( "shortDate" );
			table.string( "usrla_time_display", 60 ).default( "shortTime" );
			table.string( "usrla_datetime_display", 60 ).default( "shortDateshortTime" );
			table.string( "usrla_ui_theme", 15 ).default( "blue" );
			table.string( "usrla_account_reminder", 80 ).nullable();
			table.timestamp( "usrla_account_created_dt");
			table.string( "usrla_last_login_ip", 15 ).nullable();
			table.string( "usrla_last_login_host", 80 ).nullable();
			table.timestamp( "usrla_last_login_dt");
			table.boolean( "usrla_account_status").default( 1 );
			table.timestamp( "usrla_account_status_dt");
			table.timestamp( "usrla_account_modified_dt");
		} );

	}

	function down( schema, query ){
		schema.dropIfExists( "tab_user_accounts" );

	}

}
