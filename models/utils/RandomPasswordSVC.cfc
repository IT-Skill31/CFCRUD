// Filename:     RandomPasswordSVC.cfc
// Location:     /models/utils/RandomPasswordSVC.cfc
// Code from Ben Nadel converted from tags to script syntax
// Purpose:      Generates a random password that:
//  			    - Must be exactly 8 characters in length
//				    - Must have at least 1 number
//				    - Must have at least 1 uppercase letter
//				    - Must have at least 1 lower case letter

component {  

public string function randPassword()  {

// Set available lower case characters to choose from to build the password  
var strLowerCaseAlpha = "abcdefghijklmnopqrstuvwxyz";

// Set corresponding available upper case values to add to the pool
var strUpperCaseAlpha = UCase( strLowerCaseAlpha );

// Set up available numbers
var strNumbers = "0123456789";

// Set up additional valid password characters
var strOtherChars = "~!@##$%^&*";

// When selecting random value, we want to be able to easily choose from the entire set. 
// To this effect, we are going to concatenate all the previous valid character sets.

var strAllValidChars = (
    strLowerCaseAlpha &
    strUpperCaseAlpha &
    strNumbers &
    strOtherChars
    );

 // Create an array to contain the password
 var arrPassword = ArrayNew( 1 );

// When creating a password, there are certain rules that we
// need to follow. That is, the password must:
//  - be exactly 8 characters in length
//  - have at least 1 number
//  - have at least 1 uppercase letter
//  - have at least 1 lower case letter

// Select the random number from our number set
var arrPassword[ 1 ] = Mid(
    strNumbers,
    RandRange( 1, Len( strNumbers ) ),
    1
    ); 

// Select the random letter from our lower case set
var arrPassword[ 2 ] = Mid(
    strLowerCaseAlpha,
    RandRange( 1, Len( strLowerCaseAlpha ) ),
    1
    );

// Select the random letter from our upper case set
var arrPassword[ 3 ] = Mid(
    strUpperCaseAlpha,
    RandRange( 1, Len( strUpperCaseAlpha ) ),
    1
    );

// ASSERT: At this time, we have satisfied the character requirements of the password, but NOT the length
// requirement. In order to do that, we must add more random characters to make up a proper length.
// Now, create rest of the password:

 for (i = (ArrayLen( arrPassword ) + 1); i LTE 8; i++) {

      arrPassword[i] = Mid(strAllValidChars,
        RandRange( 1, Len( strAllValidChars ) ),
        1
        ); 		
		 
			}

// Now, we have an array that has the proper number of characters. But, we don't always want the first
// three characters to be of the same order (by type). Therefore, let's use the Java Collections utility 
// class to shuffle this array into a "random" order.

CreateObject( "java", "java.util.Collections" ).Shuffle(arrPassword);

// We now have a randomly shuffled array, and we just need to join all the characters into a single string. 
// We can do this by converting the array to a list and then just provide no delimiters (empty string delimiter).

var strPassword = ArrayToList(arrPassword,"");

return strPassword;


    }

}


