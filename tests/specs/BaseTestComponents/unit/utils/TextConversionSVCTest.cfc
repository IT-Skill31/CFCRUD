component extends="tests.resources.BaseIntegrationSpec" {

	property name="toAscii" inject="models.utils.TextConversionSVC";

	function run(){
		describe( "UNICODE text conversion", function() {
			beforeEach( function() {

			} );

			it( "can convert UNICODE text in English to its ASCII representation", function() {

				var input = "sales";	
				var result = toAscii.getConvertedText(input);
				
				expect( result ).toBe("sales");

			} );

			it( "can convert UNICODE text in French to its ASCII representation", function() {

				var input = "comptabilité";	
				var result = toAscii.getConvertedText(input);
				
				expect( result ).toBe("comptabilit\u00E9");

			} );

			it( "can convert UNICODE text in Arabic to its ASCII representation", function() {

				var input = "الجمعة";	
				var result = toAscii.getConvertedText(input);
				
				expect( result ).toBe("\u0627\u0644\u062C\u0645\u0639\u0629");

			} );

			it( "can convert UNICODE text in Japanese to its ASCII representation", function() {

				var input = "やること";	
				var result = toAscii.getConvertedText(input);
				
				expect( result ).toBe("\u3084\u308B\u3053\u3068");

			} );

			it( "can convert UNICODE text in Korean to its ASCII representation", function() {

				var input = "회계하는 거요";	
				var result = toAscii.getConvertedText(input);
				
				expect( result ).toBe("\uD68C\uACC4\uD558\uB294 \uAC70\uC694");

			} );

			it( "can convert UNICODE text in Russian to its ASCII representation", function() {

				var input = "Воскресенье";	
				var result = toAscii.getConvertedText(input);
				
				expect( result ).toBe("\u0412\u043E\u0441\u043A\u0440\u0435\u0441\u0435\u043D\u044C\u0435");

			} );

			
		} );
	}

}
