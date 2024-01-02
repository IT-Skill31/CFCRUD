component table="tab_processes" extends="quick.models.BaseEntity" accessors="true" {

	property name="processCD" column="pro_process_cd" ;
	property name="processDictionaryKey" column="pro_dictionary_key" ;
	property name="processDescription" column="pro_process_ds" ;
	property name="processIcon" column="pro_process_icon" ;
	
	variables._key = "processCD";

	function keyType() {
        return variables._wirebox.getInstance( "NullKeyType@quick" );
    }

	// Relationships

	function profiles() {
       return hasMany( "Profile" );
    }

	function dictionaryKey() {
		return belongsTo ( "DictionaryKey","pro_dictionary_key","dix_dictionary_key" );
	}

	// Other methods

	
}
