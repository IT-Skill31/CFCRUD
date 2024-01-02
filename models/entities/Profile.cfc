component table="tab_profiles" extends="quick.models.BaseEntity" accessors="true" {

	property name="profileID" column="prf_profile_id" ;
	property name="profileName" column="prf_profile_nm";
	property name="profileProcessCD" column="prf_process_cd";
	property name="profileRoleName" column="prf_role_nm";
	property name="profileScopeID" column="prf_scope_id";
	property name="profileDescription" column="prf_profile_ds";

	// Quick assumes auto-incrementing key type by default
	variables._key = "profileID";

	// Relationships

	function userProfiles() {
       return hasMany( "UserProfile" );
    }

	function role() {
		return belongsTo ( "Role","prf_role_nm","rol_role_nm" );
	}

	function process() {
		return belongsTo ( "Process","prf_process_cd","pro_process_cd" );
	}

	function profileScope() {
		return belongsTo ( "ProfileScope","prf_scope_id","psc_scope_id" );
	}
	
	
}
