<!--- Views/roles/index.cfm --->

<cfoutput>

<!--- Display translated form title --->
<cfset request.tslFormTitle = "List of roles" />

<!--- screen title --->
<p><h1>#request.tslFormTitle#</h1></p>

<div class="row mt-3">
    <div class="border border-0 col-12">
        <p class="m-b btn-groups my-2">
        <a href="#event.buildLink('roles.new')#" name="btn_new" class="btn btn-primary">New</a>
        </p>
    </div>    
</div>       
           
<cfif prc.roles.isEmpty() >
   <div class="card mb-3">
        <div class="card-body">
            <p class="card-text">No available roles</p> 
        </div>
   </div>
    <cfelse>

    <table class="table">
        <thead class="thead-light">
            <tr>
                <th class="text-center"><span class="fa fa-pencil"></span>
                <th scope="col">Role name</th>
                <th scope="col">Role description</th>
               <th class="text-center"><span class="fa fa-pencil"></span></th>
            </tr>
        </thead>
        <tbody>
           <cfloop array="#prc.roles#" index="role">
            <tr>
                <td class="text-center"><a href="#event.buildlink("roles.#role.getRoleName()#")#" class="card-link">Read</a></td>
                <td >#role.getRoleName()#</td>
                <td >#role.getRoleDescription()#</td>
                <td class="text-center"><a href="#event.buildlink("roles.#role.getRoleName()#.edit")#" class="card-link">Edit</a></td>
            </tr>
           </cfloop>
        </tbody>
    </table>

</cfif>

<p class="container">
<div class="text-dark bg-warning">#getInstance( "MessageBox@cbmessagebox" ).renderIt()#</div>  
</p>


</cfoutput>