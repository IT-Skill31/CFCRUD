component extends="tests.resources.BaseIntegrationSpec" {

	property name="gmtSVC" inject="models.utils.datetime.GMTconvSVC";

	function run(){
		describe( "GMT conversion service", function() {
			beforeEach( function() {

			} );

			it( "can convert a value in seconds to a time difference expressed in hours and minutes", function() {

				var seconds = 5400;	
				var timeDifference = gmtSVC.secondstoGMT(seconds);
				
				expect( timeDifference ).toBe("+01:30");

			} );

			it( "can build an array of timezones defined as GMT offsets", function() {

				var timezones = arrayNew();
				
				var westboundary = -14400;
				var eastboundary = 14400;
				var increment = 3600;

				timezones = gmtSVC.buildGMTArray(westboundary,eastboundary,increment);
				
				expect( arrayLen(timezones) ).toBe(8);
				expect( timezones ).toBe([-10800, -7200, -3600, 0, 3600, 7200, 10800, 14400]);

			} );

			
		} );
	}

}
