//  Filename:     TextConversionSVC.cfc
//  Location: 	  /models/utils/TextConversion.cfc
//  Created by:   Philippe Sambor
//  Purpose:      Converts native UNICODE text translations into its universal ASCII character representation.

component { 

public string function getConvertedText(required string tslInputKey) {

	// Load the Java StringEscapeUtils class from apache.commons.lang
	var stringUtils = createObject("java", "org.apache.commons.lang.StringEscapeUtils");

	// Instantiate the object
	var textConvert = stringUtils.init();
		
	// Convert the input value to its Ascii representation
	var tslkey2ascii = textConvert.escapeJava(arguments.tslInputKey);

	return tslkey2ascii;

	}

}