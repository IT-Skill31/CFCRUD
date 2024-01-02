# Prerequisites

You may use your preferred environment such as Windows, Mac or Linux during the workshop although the screencast presentation will be delivered from a Mac.

## [GitUI]()

In case you do not already have a Git UI Client for your environment, you may download one either at:

* https://git-scm.com
* https://www.sourcetreeapp.com

## [IDE]()

Use your favorite code editor. However if you do not have one, we recommend VSCode (Visual Studio Code). 
You can install a CFML syntax plug-in within the IDE.

* https://code.visualstudio.com/download

## [Java](https://www.java.com/en/) (Version 8)

This can be downloaded bundled with CommandBox if needed
* https://www.java.com/en/
* https://www.ortussolutions.com/products/commandbox

## [CommandBox CLI](https://www.ortussolutions.com/products/commandbox#download) (Version 5+.\*)

On a Mac, Commandbox installation is straightforward using Homebrew. However, if you do not have the required Java JDK already installed, homebrew will prompt you to install it first, prior to the actual commandbox installation.

```
brew install commandbox
```

Commandbox binaries will be installed at /usr/local/cellar/commandbox/version

Then run the `box` command within the bin directory at the above location. This is a one time process that will configure commandbox. On Mac, the `box`command will be made automatically available system-wide in any terminal window. If it does not, place the `box` binary in your `/usr/bin` directory. 

Otherwise, for other platforms, follow download and installation instructions here:

* https://www.ortussolutions.com/products/commandbox#download
* https://commandbox.ortusbooks.com/content/setup/installation

In addition, you may configure your Commandbox terminal to display the bullet train command line interface. This is optional. To do so, look up the Bullet-Train documentation.

## MySQL Server (5.7)

You need to have a running MySQL Server locally.
If you don't have one already on your system, you can get started easily with
a download of [MySQL](https://dev.mysql.com/downloads/mysql/) for your operating system.

`However, note that MySQL 5.7 appears no longer downloadable on MacOS from the MySQL site`. 

If you need a MySQL 5.7 installation on Mac, open a terminal and use the command:

**brew install mysql@5.7**

Then, follow the instructions to update your PATH and to get MySQL 5.7 launched as a background service

> **Important** : Please make sure you have version 5.7 and not 5.8 as the JDBC drivers in Lucee and Adobe CF have
 conflicting issues with MySQL version 5.8 (a.k.a MySQL 8)

## MySQL Client

You will want a SQL client to inspect and interact with your database. Whatever your favourite MySQL client, **you must be allowed to run an SQL script**, meaning loading an SQL file into an import utility and run it. You can use any client you would like. Here are a few we like ourselves:

* [Sequel Pro](https://sequelpro.com) (Mac, Free)
* [Heidi SQL](https://www.heidisql.com) (Windows, Free)
* [Data Grip](https://www.jetbrains.com/datagrip/) (Cross Platform, Commercial / Free Trial)
* [phpMyAdmin](https://www.phpmyadmin.net/downloads/)

### Launch your MySQL Client
 
You need privileges such as CREATE,ALTER,DROP to manage a database. In doubt, login to MySQL as “root” in order to avoid problems during the installation.

```sh
Create a new database called `cbox1` implementing the `utf8_general_ci` collation.
```

## Useful Resources

* ColdBox Api Docs: https://apidocs.ortussolutions.com/coldbox/5.7.0/index.html
* ColdBox Docs: https://coldbox.ortusbooks.com
* WireBox Docs: https://wirebox.ortusbooks.com
* TestBox Docs: https://testbox.ortusbooks.com
* TestBox Api Docs: https://apidocs.ortussolutions.com/testbox/2.8.0+191/index.html
