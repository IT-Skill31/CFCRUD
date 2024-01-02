component table="tab_profile_scopes" extends="quick.models.BaseEntity" accessors="true" {

	property name="profileScopeID" column="psc_scope_id" ;
	property name="ProfileScopeName" column="psc_scope_nm";
	property name="ProfileScopeType" column="psc_scope_type";
	property name="profileScopeContext" column="psc_scope_context";
	property name="profileScopeDescription" column="psc_scope_ds";

	// Quick assumes auto-incrementing key type by default
	variables._key = "profileScopeID";

	// Relationships

	function profiles() {
       return hasMany( "Profile" );
    }
	
}
