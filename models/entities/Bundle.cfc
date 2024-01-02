component table="tab_bundles" extends="quick.models.BaseEntity" accessors="true" {

	property name="bundleCD" column="bun_bundle_cd" ;
	property name="bundleName" column="bun_bundle_nm" ;
	property name="bundleExtranetName" column="bun_extranet_nm" ;
	
	variables._key = "bundleCD";

	function keyType() {
        return variables._wirebox.getInstance( "NullKeyType@quick" );
    }

	// Relationships

	function dictionaryKeys() {
       return hasMany( "DictionaryKey" );
    }

	function resourceBundles() {
       return hasMany( "ResourceBundle" );
    }
	
}
