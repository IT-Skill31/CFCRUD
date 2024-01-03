<cfoutput>

<div class="row">

<!---Left Bar --->

	<div class="col-lg-3">
		<div class="card text-left card-block mx-1 mt-3">
			<nav>
			<ul class="card-body nav flex-column bg-light">
				<p><li class="nav-item"><h2>Menu options</h2></li></p>
				<li class="nav-item">
					<a class="nav-link" href="#event.buildLink("Processes")#">Processes</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#event.buildLink("Roles")#">Roles</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#event.buildLink("Profiles")#">Profiles</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#event.buildLink("UserProfiles")#">User profiles</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#event.buildLink("ProfileScopes")#">Profile scopes</a>
				</li>		
			</ul>
		</div>
	</div>

 <!--- Main view --->

	<div class="col-lg-9"> 

        <h1 class="text-center mt-5">This is the app_admin/index.cfm view</h1>

    </div>  

</div>

</cfoutput>