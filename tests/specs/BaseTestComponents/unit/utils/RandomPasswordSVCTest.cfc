component extends="tests.resources.BaseIntegrationSpec" {

	property name="gpass" inject="models.utils.RandomPasswordSVC";

	function run(){
		describe( "random password generation", function() {
			beforeEach( function() {

			} );

			it( "can generate a random password", function() {
	
				var result = gpass.randPassword();

				expect(result.len()).toBe(8);

			} );

			
		} );
	}

}
