component table="tab_user_profiles" extends="quick.models.BaseEntity" accessors="true" {

	property name="userLoginID" column="usrprf_login_id" ;
	property name="userProfileID" column="usrprf_profile_id" ;
	property name="userWorkgroupID" column="usrprf_workgroup_id" ;
	property name="userProfileOK" column="usrprf_profile_ok" ;
	
	variables._key = ["userLoginID","userProfileID"];

	function keyType() {
        return variables._wirebox.getInstance( "NullKeyType@quick" );
    }

	// Relationships

	function user() {
		return belongsTo ( "User","usrprf_login_id", "id" );
	}

	function profile() {
		return belongsTo ( "Profile","usrprf_profile_id","prf_profile_id" );
	}

	// Other methods

	function scopeAssigned( query ) {
        return query.where( "userProfileOK", true );
    }

}
