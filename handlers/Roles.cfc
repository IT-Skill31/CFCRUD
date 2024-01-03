/**
* I am the Roles handler object
*/

component secured { 

property name="flash" inject="coldbox:flash";
property name="messagebox" inject="MessageBox@cbmessagebox";  

  function index(event, rc, prc)  {

  prc.roles = getInstance( "Role" ).all();

  // prc.roles = getInstance( "Role" )
  //   .orderBy( "roleName" )
  //   .get();

  event.setView( "roles/index");  

  }

//  function show(event, rc, prc)  {

//   prc.role = getInstance( "Role" ).findOrFail(rc.roleName);
//   event.setView( "roles/show");

//   }


}