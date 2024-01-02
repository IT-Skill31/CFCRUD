component table="tab_dictionary_groups" extends="quick.models.BaseEntity" accessors="true" {

	property name="dictionaryGroupID" column="dgr_group_id" ;
	property name="dictionaryGroupName" column="dgr_group_nm";
	property name="dictionaryGroupDescription" column="dgr_group_ds";

	// Quick assumes auto-incrementing key type by default
	variables._key = "dictionaryGroupID";

	// Relationships

	function dictionaryKeys() {
       return hasMany( "DictionaryKey" );
    }
	
}
