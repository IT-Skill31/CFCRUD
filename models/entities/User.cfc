component table="tab_user_accounts" extends="quick.models.BaseEntity" accessors="true" {

	property name="bcrypt" inject="@BCrypt" persistent="false";

	property name="id";
	property name="email" column="usrla_email_login";
	property name="password" column="usrla_password";
	property name="emailNotify" column="usrla_email_notify";
	property name="nickname" column="usrla_nickname";
	property name="greetings" column="usrla_greetings";
	property name="firstname" column="usrla_firstname";
	property name="middlename" column="usrla_middlename";
	property name="lastname" column="usrla_lastname";
	property name="localeCode" column="usrla_locale_cd";
	property name="useGregorianCalendar" column="usrla_use_gregorian_calendar";
	property name="timezone" column="usrla_timezone";
	property name="dateDisplay" column="usrla_date_display";
	property name="timeDisplay" column="usrla_time_display";
	property name="datetimeDisplay" column="usrla_datetime_display";
	property name="uitheme" column="usrla_ui_theme";
	property name="accountReminder" column="usrla_account_reminder";
	property name="accountCreatedDatetime" column="usrla_account_created_dt";
	property name="lastloginIP" column="usrla_last_login_ip";
	property name="lastloginhost" column="usrla_last_login_host";
	property name="lastloginDatetime" column="usrla_last_login_dt";
	property name="accountStatus" column="usrla_account_status";
	property name="accountStatusDatetime" column="usrla_account_status_dt";
	property name="accountModifiedDatetime" column="usrla_account_modified_dt";
	

	public User function setPassword( required string password ){
		return assignAttribute( "password", bcrypt.hashPassword( arguments.password ) );
	}

	public boolean function hasPermission( required string permission ){
		return true;
	}

	public boolean function isValidCredentials( required string email, required string password ){
		var user = newEntity().where( "email", arguments.email ).first();
		if ( !user.isLoaded() ) {
			return false;
		}
		return bcrypt.checkPassword( arguments.password, user.getPassword() );
	}

	public User function retrieveUserByUsername( required string email ){
		return newEntity().where( "email", arguments.email ).firstOrFail();
	}

	public User function retrieveUserById( required numeric id ){
		return newEntity().findOrFail( arguments.id );
	}

	public struct function getMemento(){
		return { "email" : variables.getEmail() };
	}

	// Relationships

	function userProfiles() {
       return hasMany( "UserProfile" );
    }

	function locale() {
		return belongsTo ( "Locale","usrla_locale_cd","glob_locale_cd" );
	}

}
