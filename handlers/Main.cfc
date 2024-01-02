component extends="coldbox.system.EventHandler" secured {

	// Default Action
	function index( event, rc, prc ){
		prc.welcomeMessage = "Building a foundation <br> with Quick ORM";
		event.setView( "main/index" );
	}

	/************************************** IMPLICIT ACTIONS *********************************************/

	function onAppInit( event, rc, prc ){
	}

	function onRequestStart( event, rc, prc ){
	}

	function onRequestEnd( event, rc, prc ){
	}

	function onSessionStart( event, rc, prc ){
	}

	function onSessionEnd( event, rc, prc ){
		var sessionScope = event.getValue( "sessionReference" );
		var applicationScope = event.getValue( "applicationReference" );
	}

	function onException( event, rc, prc ){
		event.setHTTPHeader( statusCode = 500 );
		// Grab Exception From private request collection, placed by ColdBox Exception Handling
		var exception = prc.exception;
		// Place exception handler below:
	}

	// function added with config/Coldbox missingTemplateHandler settings
	// onMissingTemplate() function must also be in Application.cfc
	// added error404.cfm view under views/main

	function missingTemplate(event,rc,prc){
    // Log a warning
	log.warn( "Missing page detected: #rc.missingTemplate#");

    // Do a quick page not found and 404 error
    event.renderData( data="<h1>Missing template</h1>", statusCode=404 );

    // Set a page for rendering and a 404 header
	event.setView( "main/error404" ).setHTTPHeader( "404", "Page Not Found" );
	
	}

}
