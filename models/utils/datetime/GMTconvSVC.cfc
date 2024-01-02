
// Filename:     GMTconvSVC.cfc
// Location:     /models/utils/datetime/GMTconvSVC.cfc
// Created by:   Philippe Sambor
// Purpose:      Implements a universal GMT conversion service component

component {

// I convert a value in seconds to a GMT offset expressed in hours and minutes.

public string function secondstoGMT(required numeric seconds=0) {

  // We are dealing with a periodic function with an amplitude of 86,400 seconds (24 hours cycle)
  // Ensure that the input in seconds is always within the range of -43200, +43200 
  // which translates into a GMT offset range expressed in hours and minutes of (-12:00, +12:00)

  var gmtVal = arguments.seconds MOD(43200);
  var time = "";
  var basetime = "";
  var minutes = "";
  var hours = "";
  var currentBasetime ="";
  var timeDifference = "";

  // GMT offset is a value in seconds - (e.g: 1 hour = 3600s). We must reformat it to be displayed as -hh:nn or +hh:nn
  // Note that values between 11:00am (-3600) and 01:00pm (+3600) are displayed in the 12 hours format hh:nn 
  //  ** Note that the Lucee engine still formats minutes as "mm" instead of "nn" for Adobe

  // Because timeDifference only holds positive time values in a 12 hours cycle, we need to transform the data
  // resulting from CreateTimeSpan() method in order to get a consistent positive or negative time value to add 
  // or subtract from GMT taken as a reference. As a result we must identify the patterns in which time values are returned:

  //  A - When the value input in seconds is a multiple of 43200 (12am midnight, 12pm noon)
  //  B - Between 12am midnight and 1 am
  //  C - Between 1am and 11am 
  //  D - Between 11am and 12pm (noon)
  //  E - After 12pm (noon) until 12am (midnight) 

  // Case A - When the input received in seconds is a multiple of 43200

  if (gmtVal EQ 0) {
    
    if (arguments.seconds LT 0) {

        // at 12 midnight (at the start of the 24 hours cycle)
        timeDifference = "-" & TimeFormat(CreateTimeSpan(0,0,0,gmtVal),"hh:mm");

        } else {

        switch(arguments.seconds)  {

          // at 12 noon (Here, I need a 24 hours cycle representation with HH:mm to get 00:00)
          case 0:
          timeDifference = TimeFormat(CreateTimeSpan(0,0,0,gmtVal),"HH:mm"); 
          break;

          // at 12 midnight (at the end of the 24 hours cycle)
          default:
          timeDifference = "+" & TimeFormat(CreateTimeSpan(0,0,0,gmtVal),"hh:mm");
          
      }

    }

  }  

  // Case B - Compute GMT offset between 12am midnight and 1 am

  if (gmtVal LT -39600) {

      time = TimeFormat(CreateTimeSpan(0,0,0,gmtVal),"hh:mm" );

      // set the base time for adjustment as 12:00 midnight (-43200 seconds)
      baseTime = TimeFormat(CreateTimeSpan(0,0,0,-43200),"hh:mm" );

      // extract the value in minutes returned by the time variable
      minutes = listGetAt(time,2,":");

      // subtract minutes to the base time (12am midnight) to derive the GMT offset
      timeDifference = "-" & TimeFormat(DateAdd("n",-minutes, baseTime),"hh:mm");

      }

  // Case C - Compute GMT offset between 1am and 11am

  else if (gmtVal GTE -39600 AND gmtVal LTE -3600) {

      time = TimeFormat(CreateTimeSpan(0,0,0,gmtVal),"hh:mm" );

      // extract the value in hours and minutes returned by the time variable
      hours = listGetAt(time,1,":"); 
      minutes = listGetAt(time,2,":");

      // set the base time for adjustment as 12:00 noon
      baseTime = TimeFormat(CreateTimeSpan(0,0,0,0),"hh:mm" );

      // subtract the number of hours from the base time
      currentBaseTime = TimeFormat(DateAdd("h",-hours, baseTime),"hh:mm");

      // subtract the number of minutes from the current base time to derive the GMT offset
      timeDifference = "-" & TimeFormat(DateAdd("n",-minutes, currentBaseTime),"hh:mm");

      }

  // Case D - Compute GMT offset between 11am and 12 noon

  else if (gmtVal GT -3600 AND gmtVal LT 0) {

      time = TimeFormat(CreateTimeSpan(0,0,0,gmtVal),"hh:mm" );

      // extract the value in minutes returned by the time variable
      minutes = listGetAt(time,2,":");

      // set the base time for adjustment as 01:00
      baseTime = TimeFormat(CreateTimeSpan(0,0,0,3600),"hh:mm");

      // subtract the number of minutes from the base time to derive the GMT offset
      // Use HH for 24 hours format to get 00:00 instead of 12:00. (makes it easier to derive the GMT offset)
      
      timeDifference = "-" & TimeFormat(DateAdd("n",-minutes, baseTime),"HH:mm");

      }

  // Case E - Compute GMT offset after 12 noon until midnight

  else if (gmtVal GT 0) {

      // Use HH for 24 hours format to get 00:00 instead of 12:00 (makes it easier to derive the GMT offset) 

      timeDifference = "+" & TimeFormat(CreateTimeSpan(0,0,0,gmtVal),"HH:mm" );

      }

  return timeDifference;

}

public array function buildGMTarray(required numeric westboundary=-46800,
                                    required numeric eastboundary=43200,
                                    required numeric increment=3600) {

  var timezones = ArrayNew();

  // Set the GMT westernmost boundary to -46800 (-43200 seconds minus 3600 seconds)
  // for the first loop to be set at -43200 (-12:00)
  
  var gmtValSec = arguments.westBoundary;

  // Loop until gmtValSec = 43200 (+12:00)

  while (gmtValSec LT arguments.eastBoundary) {
  
  //increment with every loop (default is one hour  
	gmtValSec = gmtValSec + arguments.increment;
	ArrayAppend(timezones, gmtValSec);

  }

  return timezones;

  }

}