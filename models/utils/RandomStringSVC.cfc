/**
* I am the RandomStringSVC Model object
* Code from Ben Forta converted from tags to script syntax
*/

component {  

public string function randstring(required numeric length)  {

  var result = "";

  for (i = 1; i LTE arguments.length; i++) {

      result = result&Chr(RandRange(65, 90));		
		 
			}

    return result;

  }

}