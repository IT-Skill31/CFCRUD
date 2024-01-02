component table="tab_roles" extends="quick.models.BaseEntity" accessors="true" {

	property name="roleName" column="rol_role_nm" ;
	property name="roleDescription" column="rol_role_ds" ;
	
	variables._key = "roleName";

	function keyType() {
        return variables._wirebox.getInstance( "NullKeyType@quick" );
    }

	// Relationships

	function profiles() {
       return hasMany( "Profile" );
    }
	
}
