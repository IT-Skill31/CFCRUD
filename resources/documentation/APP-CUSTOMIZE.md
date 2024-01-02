The project customization starts at section 3, after the Getting started section. Here is a check-list of the customization steps you are going to perform in relation to the various sections of the course. Keep it handy in order to guide you in reproducing the content of the videos.

# Section 3 - Customize the user registration

## L10 - Modify the users table

- Download the yyyy_mm_dd_xxxxxx_create_tab_user_accounts migration file to /resources/database
- Rollback the users table migrated in L6 (Configure the project) => migrate down
- Copy yyyy_mm_dd_xxxxxx_create_tab_user_accounts to /resources/database/migrations
- Delete the old /resources/database/migrations/yyyy_mm_dd_xxxxxx_create_users.cfc
- migrate the tab_user_accounts table to the database => migrate up

## L11 - Modify the User entity

- Download the User.cfc file from Lecture 11 to /models/entities/User.cfc

## L12 - Modify the Registrations handler

- Download the Registrations.cfc file from Lecture 12 to /handlers/Registrations.cfc

## L13 - Modify the Registrations view

- Download the new.cfm file from Lecture 13 to /views/registrations/new.cfm

## L14 - Modify the Registrations test

- Download the RegistrationsTest.cfc file from Lecture 14 to /tests/specs/integration/registrationsTest.cfc

# Section 4 - Enhance the database schema

The entire schema will be created with cfmigrations CFML components. Here are the few commands that we are going to run from the commandbox prompt in order to build our new application's schema.

```
> Migrate create <create_table_name>  // Generates an empty cfc file
> Migrate up // Commit the latest migration file to the database schema
> Migrate down // Rollback all previously ran migrations that were committed to the database schema
> Migrate refresh // Rollback all previous migrations down and commit all migrations up again 

```

## L15 - Create migration components
 
Build one empty migration file per table for the following sequence:

migrate create create_tab_locales
migrate create create_tab_languages
migrate create create_tab_roles
migrate create create_tab_processes
migrate create create_tab_dictionary_groups
migrate create create_tab_bundles
migrate create create_tab_dictionary_keys
migrate create create_tab_profile_scopes
migrate create create_tab_profiles
migrate create create_tab_user_profiles
migrate create create_tab_resource_bundles
migrate create create_tab_translations

This process will generate files in the /resources/database/migrations folder
in the form yyyy_mm_dd_xxxxxx_<create_tab_name>.cfc where yyyy_mm_dd_xxxxxx is a time stamp

## L16 - Add tables columns and seed data

- Download schema_definitions.zip from the L16 chapter to /resources/database/schema_definitions
- Copy and paste the content of each schema definition file to its respective cfmigrations component
- When all the above migration files are updated with their schema definition, migrate them to the database

```
migrate up

```

Access your database and verify that each table was properly created

## L17 - Add foreign key constraints

- Download the TamarindERD.pdf entity relationship diagram

When all tables were created successfully, take a look at the entity relationship diagram and focus on each children entity. Build one migration file to implement all foreign key constraints across all tables, as the last migration file.

- Create an empty migration file for the foreign key constraints

migrate create create_fk_constraints

This command will place a file named yyyy_mm_dd_xxxxxx_create_fk_constraints.cfc in the /resources/database/migrations folder.

Copy the content of the foreign key constraints file definition that should be the last file left in the schema_definitions folder and paste it in the yyyy_mm_dd_xxxxxx_create_fk_constraints component you just created

```
migrate up

```

Access your database and verify that the foreign key constraints were properly added to the schema

# Section 5 - Expand the model with new entities

## L18 - Update the User entity

The User entity was customized in section 3 (L11). In this lesson we review and explain the content of the entity and we update the relationships in the user entity

- Verify that the relationships in the User entity are enabled as follows from line 61 to line 67:

// Relationships

	function userProfiles() {
       return hasMany( "UserProfile" );
    }

	function locale() {
		return belongsTo ( "Locale","usrla_locale_cd","glob_locale_cd" );
	}

## L19 - Map tab_user_profiles to UserProfile entity

- Download and extract Admin_entities.zip to /models/entities/Admin_entities folder
- Move the content of the Admin_entities sub-folder to /models/entities
- Delete the Admin_entities sub-folder
 
Note how a composite primary key is mapped from a table to a Quick ORM entity
Review the mapping of all remaining Admin tables

## L20 - Map tab_languages to Language entity

- Download and extract Globalization_entities.zip to /models/entities/Globalization_entities folder
- Move the content of the Globalization_entities sub-folder to /models/entities
- Delete the Globalization_entities sub-folder

Note how a primary key of type String is mapped from a table to a Quick ORM entity

## L21 - Map tab_dictionary_groups to DictionaryGroup entity

Note how a primary key of type numeric (DictionaryGroupID) is mapped from a table to a Quick ORM entity

## L22 - Map tab_dictionary_keys to DictionaryKey entity

Note how a primary key of type numeric (DictionaryGroupID) is mapped from a table to a Quick ORM entity
Review the mapping of all remaining Globalization tables

# Section 6 - Build Tamarind Admin features

## L23 - Add foundation model components

- Download and extract BaseComponents.zip to /models/BaseComponents folder
- Move TenantCompanySVC.cfc to /models
- Move the datetime folder to models/utils/datetime
- Move RandomPasswordSVC.cfc to models/utils
- Move TextConversionSVC.cfc to models/utils
- Move and replace RandomStringSVC.cfc in models/utils
- Delete the /models/BaseComponents sub-folder

- Download and extract BaseTestComponents.zip to /tests/specs/unit/BaseTestComponents folder
- Move TenantCompanySVCTest.cfc to /tests/specs/unit/TenantcompanySVCTest.cfc
- Move the datetime folder to /tests/specs/unit/utils/datetime sub-folder
- Move RandomPasswordSVCTest.cfc to /tests/specs/unit/utils/RandomPasswordSVCTest.cfc
- Move TextConversionSVC.cfc to /tests/specs/utils/TextConversionSVCTest.cfc
- Move and replace RandomStringSVCTest.cfc in tests/specs/unit/utils
- Delete the /tests/specs/unit/BaseTestComponents sub-folder

## L24 - Create the Admin menu

- Download and extract L24_handlers.zip to /handlers
- Download and extract L24_views.zip to /views

- Create a handler called "App_admin" with an index view (landing page)
- Run the command:

```
coldbox create handler name="app_admin" actions="index"

```

Modify the generated app_admin handler as follows:

component secured {


	/**
	 * index
	 */
	 
	function index( event, rc, prc ){
		event.setView( "app_admin/index" );
	}

}

Add the menu option links on the Admin landing page

- Move /views/L24_views/app_admin_index.cfm to /views/app_admin/app_admin_index.cfm
- Delete /views/app_admin/index.cfm
- Rename /views/app_admin/app_admin_index.cfm to /views/app_admin/index.cfm

## L25 - Create the Roles feature

- Download the L25_Router file to /config folder
- Delete /config/router.cfc
- Rename /config/L25_Router.cfc to /config/Router.cfc

Create a handler called "Roles" with an index view:

coldbox create handler name="Roles" actions="index"

- Update the handler with our code:
- Move /handlers/L24_handlers/Roles.cfc to /handlers/Roles.cfc

Update the index view for the Roles handler:

- Move /views/L24_views/roles_index.cfm to /views/roles/roles_index.cfm
- Delete /views/roles/index.cfm
- Rename /views/roles/roles_index.cfm to /views/roles/index.cfm

## L26 - Create the UserProfiles feature

- Create a handler called UserProfiles with an index view:

coldbox create handler name="UserProfiles" actions="index"

- Update this new handler with our code:
- Move /handlers/L24_handlers/UserProfiles.cfc to /handlers/UserProfiles.cfc

Update the index view for the UserProfiles handler:

- Move /views/L24_views/userProfiles_index.cfm to /views/userProfiles/userProfiles_index.cfm
- Delete /views/userProfiles/index.cfm
- Rename /views/userProfiles/userProfiles_index.cfm to /views/userProfiles/index.cfm

## L27 - Create all remaining admin features

Create all the remaining Admin handlers with an index view:

coldbox create handler name="Processes" actions="index"
coldbox create handler name="Profiles" actions="index"
coldbox create handler name="ProfileScopes" actions="index"

Update the remaining Admin handlers with our code

- Move /handlers/L24_handlers/Processes.cfc to /handlers/Processes.cfc
- Move /handlers/L24_handlers/Profiles.cfc to /handlers/Profiles.cfc
- Move /handlers/L24_handlers/ProfileScopes.cfc to /handlers/ProfileScopes.cfc

- Delete the L24_handlers folder
- Your handlers have changed. You must reinit the Coldbox framework: 

```
coldbox reinit

```

Add the remaining menu option views:

- Move /views/L24_views/main_index.cfm to /views/main/main_index.cfm
- Delete /views/main/index.cfm
- Rename /views/main/main_index.cfm to /views/main/index.cfm

Replace the generated /views/<handler>index.cfm with the downloaded index views

- Move /views/L24_views/processes_index.cfm to /views/processes/processes_index.cfm
- Delete /views/processes/index.cfm
- Rename /views/processes/processes_index.cfm to /views/processes/index.cfm

- Move /views/L24_views/profiles_index.cfm to /views/profiles/profiles_index.cfm
- Delete /views/profiles/index.cfm
- Rename /views/profiles/profiles_index.cfm to /views/profiles/index.cfm

- Move /views/L24_views/profileScopes_index.cfm to /views/profileScopes/profileScopes_index.cfm
- Delete /views/profileScopes/index.cfm
- Rename /views/profileScopes/profileScopes_index.cfm to /views/profilesScopes/index.cfm

- Delete the /views/L24_views folder

# Section 7 - Create the globalization module

## L28 - Create the globalization menu

- Download the L28_Main_index.cfm file from Lecture 28 to /views/main/L28main_index.cfm
- Download and extract the L28_module.zip from Lecture 28 to /modules_app/L28_module folder

Create a module called "globalization" with the following command:

```
coldbox create module globalization

```
Add a globalization menu option link on the main Home page:

- Delete /views/main/index.cfm
- Rename /views/main/L28main_index.cfm to /views/main/index.cfm

Add a landing page for the Globalization module;

- Move /modules_app/L28_module/views/home_index.cfm to /modules_app/globalization/views/home/home_index.cfm
- Delete /modules_app/globalization/views/home/index.cfm
- Rename /modules_app/globalization/views/home/home_index.cfm 
  to /modules_app/globalization/views/home/index.cfm

Update the Module configuration file:

- Move /modules_app/L28_module/ModuleConfig.cfc to replace /modules_app/globalization/ModuleConfig.cfc

## L29 - Add Languages to the globalization module

Enable a languages router resource in the ModuleConfig.cfc file:

- Uncomment line 92 under SES resources in /modules_app/globalization/ModuleConfig.cfc

Add a module handler named languages:

- Move /modules_app/L28_module/handlers/Languages.cfc to /modules_app/globalization/handlers/Languages.cfc

Add a languages list view:

- Create a /modules_app/globalization/views/languages sub directory
- Move /modules_app/L28_module/views/languages_index.cfm 
  to /modules_app/globalization/views/languages/languages_index.cfm
- Rename /modules_app/globalization/views/languages/languages_index.cfm
  to /modules_app/globalization/views/languages/index.cfm  

## L30 - Add Locales to the Globalization module

Enable a locales router resource in the ModuleConfig.cfc file:

- Uncomment line 93 under SES resources in /modules_app/globalization/ModuleConfig.cfc

Add a module handler named locales:

- Move /modules_app/L28_module/handlers/Locales.cfc to /modules_app/globalization/handlers/Locales.cfc

Add a locales list view:

- Create a /modules_app/globalization/views/locales sub directory
- Move /modules_app/L28_module/views/locales_index.cfm 
  to /modules_app/globalization/views/locales/locales_index.cfm
- Rename /modules_app/globalization/views/locales/locales_index.cfm
  to /modules_app/globalization/views/locales/index.cfm  

## L31 - Add Translations to the Globalization module

Enable a translations router resource in the ModuleConfig.cfc file:

- Uncomment line 91 under SES resources in /modules_app/globalization/ModuleConfig.cfc

Add a module handler named translations:

- Move /modules_app/L28_module/handlers/Translations.cfc 
  to /modules_app/globalization/handlers/Translations.cfc

Add a translations list view:

- Create a /modules_app/globalization/views/translations sub directory
- Move /modules_app/L28_module/views/translations_index.cfm 
  to /modules_app/globalization/views/translations/translations_index.cfm
- Rename /modules_app/globalization/views/translations/translations_index.cfm
  to /modules_app/globalization/views/translations/index.cfm  

## L31 - Create all remaining Globalization features

Enable all remaining router resources in the ModuleConfig.cfc file:

- Uncomment line 91 to line 97 under SES resources in /modules_app/globalization/ModuleConfig.cfc

Add all remaining module handlers:

- Move /modules_app/L28_module/handlers/* to /modules_app/globalization/handlers/

Add all remaining views sub-folders

- Create a "/modules_app/globalization/views/bundles" folder
- Create a "/modules_app/globalization/views/dictionaryGroups" folder
- Create a "/modules_app/globalization/views/dictionaryKeys" folder
- Create a "/modules_app/globalization/views/resourceBundles" folder

Add all remaining list views:

- Move /modules_app/L28_module/views/xxxx_index.cfm to /modules_app/globalization/views/xxxx/index.cfm

Reinit the coldbox framework with the command "coldbox reinit"

# Section 8 - Build dynamic menu navigation

## L34 - Create a menu content service component

- Download and extract the L34_Updates.zip from lecture 34 to /models/L34_updates folder
- Move /models/L34_Updates/models_MenuContentSVC.cfc to /models/MenuContentSVC.cfc
- Move /models/L34_Updates/unit_MenuContentSVCTest.cfc to /tests/spec/unit/MenuContentSVCTest.cfc

Update the Main.cfc handler:

- Move /models/L34_Updates/L34_Main.cfc to /handlers/Main.cfc

## L35 - Create a re-usable event handler

- Download and extract the L35_Updates.zip from lecture 35 to /layouts/L35_updates folder

Create a new handler called "Viewlets" by running the command:

```
coldbox create handler name="Viewlets" actions="index"

```
Update the Viewlets handler that was just generated:

- Move /layouts/handlers_Viewlets.cfc to /handlers/handlers_Viewlets.cfc
- Delete /handlers/Viewlets.cfc
- Rename /handlers/handlers_Viewlets.cfc to /handlers/Viewlets.cfc

Update the Main layout:

- Move /layouts/L35_Updates/Layouts_Main.cfm to /layouts/Layouts_Main.cfm
- Delete /layouts/Main.cfm
- Rename /layouts/Layouts_Main.cfm to /layouts/Main.cfm

Create a view called "sessionview.cfm" for the Viewlets handler:

- Move /layouts/L35_Updates/views_viewlets_seesionview.cfm to /views/Viewlets/sessionview.cfm
- Delete /views/viewlets/index.cfm
- Rename /views/views_viewlets_sessionview.cfm to /views/sessionview.cfm

From old to new menu:

- Move /layouts/L35_Updates/FromOldToNewMenu/L35app-admin-index.cfm to /views/app_admin/L35app-admin-index
- Delete /views/app_admin/index.cfm
- Rename /views/app_admin/L35app-admin-index to /Views/app_admin/index.cfm

- Move /layouts/L35_Updates/FromOldToNewMenu/L35main-index.cfm to /views/main/L35main-index.cfm
- Delete /views/main/index.cfm
- Rename /views/main/L35main-index.cfm to /views/main/index.cfm

- Move /layouts/L35_Updates/FromOldToNewMenu/L35globalization-home-index.cfm 
  to /modules_app/globalization/views/home/L35globalization-home-index.cfm
- Delete /modules_app/globalization/views/home/index.cfm
- Rename /modules_app/globalization/views/home/L35globalization-home-index.cfm 
  to /modules_app/globalization/views/home/index.cfm

Delete the /layouts/L35_updates folder  

## L36 - Finalise the dynamic menu

- Download and extract the L36_ViewsFinalUpdate.zip from lecture 36 to /views/L36_ViewsFinalUpdate folder

- Move /views/L36_ViewsFinalUpdate/L36app_admin-index.cfm to /views/app_admin/L36app_admin-index.cfm
- Delete /views/app_admin/index.cfm
- Rename /views/app_admin/L36app_admin-index.cfm to /views/app_admin/index.cfm

- Move /views/L36_viewsFinalUpdate/L36main-index.cfm to /views/main/L36main-index.cfm
- Delete /views/main/index.cfm
- Rename /views/main/L36main-index.cfm to /views/main/index.cfm

- Move /views/L36_ViewsFinalUpdate/L36GlobalizationHomeIndex.cfm
  to /modules_app/globalization/views/home/L36GlobalizationHomeIndex.cfm
- Delete /modules_app/globalization/views/home/index.cfm
- Rename /modules_app/globalization/views/home/L36globalizationHomeIndex.cfm
  to /modules_app/globalization/views/home/index.cfm  

## L37 - Create an interceptor

- Download and extract the L37_Interceptor.zip from lecture 37 to /interceptors/L37_Interceptor folder

- Move /interceptors/L37_Interceptor/interceptors_InvalidHandler.cfc 
  to /interceptors/interceptors_InvalidHandler.cfc
- Rename /interceptors/interceptors_InvalidHandler.cfc to /interceptors/invalidHandler.cfc

Register the interceptor in the Coldbox.cfc configuration file (from line 77 to 80)

- Move /interceptors/L37_Interceptor/Coldbox.cfc to /config/Coldbox.cfc

Add RouteNotFound() function in the Viewlets.cfc handler

- Move /interceptors/L37_Interceptor/Viewlets.cfc to /handlers/Viewlets.cfc

- Delete /interceptors/L37_Interceptor folder

** Reinit the framework: Coldbox reinit

# Section 9 - Finalize Tamarind Admin foundation

## L38 - Improve the Admin app navigation

- Download and extract L38_AdminViews.zip from lecture 38 to /views/L38_AdminViews folder

Update all Admin list views with a navigation cursor by moving all index files to their respective target Views folders:

- Move /views/L38_adminViews/processes/index.cfm to replace /views/processes/index.cfm
- Move /views/L38_adminViews/profiles/index.cfm to replace /views/profiles/index.cfm
- Move /views/L38_adminViews/profileScopes/index.cfm to replace /views/profileScopes/index.cfm
- Move /views/L38_adminViews/roles/index.cfm to replace /views/roles/index.cfm
- Move /views/L38_adminViews/userProfiles/index.cfm to replace /views/userprofiles/index.cfm

## L39 - Complete all Admin handlers

- Download and extract L39_AdminHandlers.zip to /handlers/L39_AdminHandlers
- Download and extract L39_AdminTests.zip to /tests/specs/integration/L39_AdminTests folder
- Download the L39_Router.cfc configuration file to /Config/L39_Router.cfc

- Delete the old /config/Router.cfc file
- Rename /config/L39_Router.cfc to /config/Router.cfc

- Move /handlers/L39_adminHandlers/* to /handlers/
- Move /tests/specs/integration/L39_AdminTests/* to /tests/specs/integration/admin/
- Delete /handlers/L39_adminHandlers folder
- Delete /tests/specs/integration/L39_AdminTests folder

** Reinit the framework: Coldbox reinit

## L40 - Create all UserProfiles views

- Move /views/L38_adminViews/userProfiles/* to replace /views/userprofiles/
- Delete /views/L38_adminViews/userProfiles/ folder

## L41 - Create all Admin SHOW views

- Move /views/L38_adminViews/processes/show.cfm to /views/processes/show.cfm
- Move /views/L38_adminViews/profiles/show.cfm to /views/profiles/show.cfm
- Move /views/L38_adminViews/profileScopes/show.cfm to /views/profileScopes/show.cfm
- Move /views/L38_adminViews/roles/show.cfm to /views/roles/show.cfm

## L42 - Create all Admin _FORM views

- Move /views/L38_adminViews/processes/_formProcess.cfm to /views/processes/_formProcess.cfm
- Move /views/L38_adminViews/profiles/_formProfile.cfm to /views/profiles/_formProfile.cfm
- Move /views/L38_adminViews/profileScopes/_formProfileScope.cfm 
  to /views/profileScopes/_formProfileScope.cfm
- Move /views/L38_adminViews/roles/_formRole.cfm to /views/roles/_formRole.cfm

## L43 - Create all Admin NEW views

- Move /views/L38_adminViews/processes/new.cfm to /views/processes/new.cfm
- Move /views/L38_adminViews/profiles/new.cfm to /views/profiles/new.cfm
- Move /views/L38_adminViews/profileScopes/new.cfm to /views/profileScopes/new.cfm
- Move /views/L38_adminViews/roles/new.cfm to /views/roles/new.cfm

## L44 - Create all Admin EDIT views

- Move /views/L38_adminViews/processes/edit.cfm to /views/processes/edit.cfm
- Move /views/L38_adminViews/profiles/edit.cfm to /views/profiles/edit.cfm
- Move /views/L38_adminViews/profileScopes/edit.cfm to /views/profileScopes/edit.cfm
- Move /views/L38_adminViews/roles/edit.cfm to /views/roles/edit.cfm

- Delete /views/L38_adminViews folder

# Section 10 - Finalize Tamarind Globalization module

## L45 - Create all Globalization handlers

- Download and extract L45_globalizationHandlers.zip from lecture 45
  to /modules_app/globalization/handlers/L45_globalizationHandlers folder
- Download and extract L45_globalizationTests.zip from lecture 45
  to /tests/specs/integration/L45_globalizationTests folder

- Move /modules_app/globalization/handlers/L45_globalizationHandlers/*
  to replace all in  /modules_app/globalization/handlers/ 

- Delete /modules_app/globalization/handlers/L45_globalizationHandlers folder   

- Rename /tests/specs/integration/L45_globalizationTests
  to /tests/specs/integration/globalization

** Reinit the framework: Coldbox reinit

## L46 - Complete all Globalization views

- Download and extract L46_globalizationViews.zip from lecture 10 
  to /modules_app/globalization/views/L46_globalizationViews folder

- Move /modules_app/globalization/views/L46_globalizationViews/*
  to replace all in /modules_app/globalization/views/ folder

- Delete /modules_app/globalization/views/L46_globalizationViews folder    

# Section 11 - Monitor query performance

## L48 - Load large tables with data

Download the following SQL scripts to /resources/database:

- tab_dictionary_keys.sql (600+ records)
- tab_translations.sql (5000+ records)

Upload the data to the cbox1 MySQL database instance using your MySQL client import utility

## L49 - Optimize query performance

Preferably use a Chrome browser
Enable cbdebugger in /config/Coldbox.cfc line 124 to 128 as follows:

function development(){
		coldbox.customErrorTemplate = "/coldbox/system/includes/BugReport.cfm";
		debugger.debugMode = true;
		debugger.expandQBPanel = true;
	}

** Reinit the framework: Coldbox reinit  

# Section 12 - Internationalization (i18n)

Disable cbdebugger in /config/Coldbox.cfc line 124 to 128 as follows:

function development(){
		coldbox.customErrorTemplate = "/coldbox/system/includes/BugReport.cfm";
		debugger.debugMode = false;
		//debugger.expandQBPanel = true;
	} 

** Reinit the framework: Coldbox reinit

## L50 - Configure the project for i18n

- Download and extract rbundles.zip to /includes/i18n/rbundles folder
- Download and extract L50_Updates.zip to /models/L50_Updates folder

- Move /models/L50_Updates/L50_Coldbox.cfc file to /config/L50_Coldbox.cfc
- Delete /config/coldbox.cfc
- Rename /config/L50_Coldbox.cfc to /config/Coldbox.cfc

- Move /models/L50_Updates/TranslationBuilderSVC.cfc to /models/TranslationBuilderSVC.cfc
- Move /models/L50_Updates/TranslationBuilderSVCTest.cfc to /tests/specs/unit/TranslationBuilderSVCTest.cfc

** Reinit the framework: Coldbox reinit

## L51 - Add a myAccount EDIT feature

- Download and extract L51_Updates.zip from lecture 51 to /handlers/L51_Updates folder

Create a new handler called myAccount:

coldbox create handler name="myAccount" actions="edit"

Create a new router resource called myAccount:

- Move /handlers/L51_updates/L51_Router.cfc to /config/L51_Router.cfc
- Delete /config/Router.cfc
- Rename /config/L51_Router.cfc to /config/Router.cfc

Update the generated myAccount handler with our code: 

- Move /handlers/L51_Updates/L51_Myaccount.cfc to /handlers/L51_Myaccount.cfc
- Delete /handlers/myAccount.cfc
- Rename /handlers/L51_myAccount.cfc to /handlers/MyAccount.cfc

Update the MenuContentSVC.cfc component because "Account" has become "MyAccount":

- Move /handlers/L51_menuContentSVC.cfc to /models/L51_MenuContentSVC.cfc
- Delete /models/MenuContentSVC.cfc
- Rename /models/L51_MenuContentSVC.cfc to /models/MenuContenSVC.cfc

Create the EDIT view for the MyAccount handler:

- Move /handlers/L51_edit.cfm to /views/myaccount/L51_edit.cfm
- Delete /views/myAccount/edit.cfm
- Rename /views/myAccount/L51_edit.cfm to /views/myAccount/edit.cfm

Delete /handlers/L51_Updates folder

** Reinit the framework: Coldbox reinit

## L52 - Translate the menu component

- Download and extract L52_Updates.zip from lecture 52 to /models/L52_Updates folder

- Move L52_MenuContentSVC.cfc to /models/L52_MenuContentSVC.cfc
- Delete /models/MenuContentSVC.cfc
- Rename /models/L52_MenuContentSVC.cfc to /models/MenuContentSVC.cfc

- Move L52_MenuContentSVCTest.cfc to /tests/specs/unit/L52_MenuContentSVCTest.cfc
- Delete /tests/specs/unit/MenuContentSVCTest.cfc
- Rename /tests/specs/unit/L52_menuContentSVCTest.cfc to /tests/specs/unit/MenuContentSVCTest.cfc

Delete /models/L52_Updates folder

** Reinit the framework: Coldbox reinit

## L53 - Create a Translation helper

- Download and extract L53_Updates.zip from lecture 53 to /includes/L53_updates folder

Leverage the Application helper to hold the getTranslations() function:

- Move /includes/L53_Updates/ApplicationHelper.cfm to replace /includes/helpers/ApplicationHelper.cfm

Modify the Main layout:

- Move /includes/L53_Updates/L53_Main.cfm to /layouts/L53_Main.cfm
- Delete /layouts/Main.cfm
- rename /layouts/L53_Main.cfm to /layouts/Main.cfm

Update the Globalization module landing page:

- Move /includes/L53_Updates/GlobalizationHomeIndex 
  to /modules_app/globalization/views/home/GlobalizationHomeIndex.cfm
- Delete /modules_app/globalization/views/home/index.cfm
- rename /modules_app/globalization/views/home/GlobalizationHomeIndex.cfm
  to /modules_app/globalization/views/home/index.cfm

 Update all the other menu landing pages:

 - Move /includes/L53_Updates/ViewMenuHeadlines/*  to /views/ViewMenuHeadlines/ folder
 - Delete /includes/L53_Updates folder

 - Move /views/ViewMenuHeadlines/app_admin.index.cfm to /views/app_admin/app_admin.index.cfm
 - Delete /views/app_admin/index.cfm
 - rename /views/app_admin/app_admin.index.cfm to /views/app_admin/index.cfm

 - Move /views/ViewMenuHeadlines/main.index.cfm to /views/main/main.index.cfm
 - Delete /views/main/index.cfm
 - Rename /views/main/main.index.cfm to /views/main/index.cfm

 - Move /views/ViewMenuHeadlines/viewlets.sessionview.cfm to /views/viewlets/viewlets.sessionview.cfm
 - Delete /views/viewlets/sessionview.cfm
 - Rename /views/viewlets/viewlets.sessionview.cfm to /views/viewlets/sessionview.cfm

 Delete /views/ViewMenuHeadlines/ folder

 ** Reinit the framework: Coldbox reinit

## L54 - Translate the core application

- Download and extract L54_Views_roles.zip to /views/L54_Views_roles folder
- Download and extract L54_GlobalizationViews_languages.zip 
  to /modules_app/globalization/views/L54_GlobalizationViews_languages folder

- Delete /views/roles and all its content
- Rename folder /views/L54_Views_roles to /views/roles 

- Delete /modules_app/globalization/views/languages and all its content
- Rename folder /modules_app/globalization /views/L54_GlobalizationViews_languages 
  to /modules_app/globalization/views/languages  














