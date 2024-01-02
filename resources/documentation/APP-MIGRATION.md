# Coldbox project migration and recovery strategies

New framework and modules versions are released on a regular basis and it is important to know how to deal
with those dynamics in order to always keep a working Coldbox project in sync with stable CFML environment versions that do not break any code. What follows assumes that all the pre-requisites are met (see PRE-REQUISITES.md documentation).

## CFML environment definition

In addition to all module dependencies, A CFML environment primarily comprises:

- A Coldbox framework version
- A Testbox testing environment version
- A CFML engine (Adobe or Lucee) version

## 1 - Migration and recovery strategies

- Restore a project baseline from a backup
- Recover a project from a repository and install Coldbox
- Install a quick-with-auth template and merge the project code
- Re-build the project

### 1.1 - Restore a project baseline from a backup

This is the most simple approach and the one recommended to pin your CFML environment
to the latest version for which your project was already working and certified. 
A project baseline includes your code, the original framework versions and all associated 
module dependencies.

- Create an empty folder
- Copy the entire project baseline to this folder
- Re-build the project (see 1.4)

### 1.2  Recover a project from a repository and install Coldbox

A repository includes the project code but excludes the CFML environment.
With this option you can select the version of the framework to be installed.

- Create an empty folder
- Clone the project from your repository to this folder
- install Coldbox and module dependencies
- Re-build the project (see 1.4)

### 1.3 Install a Coldbox template and merge the project code

This is the recommended approach when you start a new project with no available backup or repository.
You may also use this option (as an alternative to 1.2) if you want to upgrade an existing project to the latest stable CFML environment. 
However, note that with this option, you have no control over the versions of the framework that are being installed by the template. Sometimes you may have to tweak the new CFML environment to make your app work as expected.

- install the quick-with-auth Coldbox template
- Follow the APP_TEMPLATE.md documentation
- merge the project code from backup project folder
- or merge the project code from cloned repository data

### 1.4 Re-build the project

Note that ">" refers to the commandbox prompt

- Update the .env file (with your database connections)
- Run cfmigrations (to create your database schema):
	> migrate install (only once to create the cfmigrations table)
	> migrate up (to create the database schema from resources/database/migrations)
- If you start a server for the first time (if you did not have a server already defined in server.json)
	> start cfengine=lucee@5	
- Otherwise, edit server.json to remove the existing port number
	> start
	> server list (note the actual server version and running port number)
	> stop
- update server.json with the new port number
- Set password for Lucee engine
	>cfconfig set adminPassword=<yourLuceeAdminPassword>
	> start
- Connect to Lucee server administration
- Verify datasources
- Launch the app > register a new user
- Login the new user
- Run tests	



