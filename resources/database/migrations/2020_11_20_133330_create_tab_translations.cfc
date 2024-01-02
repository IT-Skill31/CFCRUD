component {
    
    function up( schema, query ) {
        schema.create( "tab_translations", function(table) {
			table.increments( "tsl_translation_id" );
			table.string( "tsl_bundle_nm", 50 );
            table.string( "tsl_dictionary_key", 200 );
            table.unique([ "tsl_bundle_nm", "tsl_dictionary_key" ], "idx_translations");
            table.string( "tsl_translated_key", 200 ).nullable();
			table.string( "tsl_translated_ascii", 300 ).nullable();
            table.boolean( "tsl_key_translated").default( 0 );
		} );
        
    }

    function down( schema, query ) {
        schema.dropIfExists( "tab_translations" );
    }

}

