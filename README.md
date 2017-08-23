# Ghost on Azure App Service

This is my fork of [Ghost 1.0](https://github.com/tryghost/ghost) with changes to run on Azure App Service. [Read here for a full introduction](https://www.chadly.net/ghost-on-azure/).

## Branches

This repo is setup with a few branches for easier maintenance. The `ghost` branch is where I commit the [Ghost releases](https://github.com/tryghost/ghost/releases) as they come out unchanged. The `azure` branch (the default branch) is where I make only the changes necessary to get it running on Azure App Service. I rebase this branch off of `ghost` as new releases come out. I then create a separate branch for each site I deploy. This way I can make theme customizations and tweaks to individual sites and rebase those changes off of the `azure` branch.

### Changes on the Azure Branch

* Add a `db.js` file in the root to make it easy to initialize/migrate a SQLite database ([since I can't run the CLI tool on Azure](https://www.chadly.net/ghost-on-azure/#clitool)).
* Force `config.js` to get the port it should run on from `PORT` env variable instead of `SERVER_PORT`. This is to make iisnode happy.
* Add `web.config` & `iisnode.yml` - standard stuff to host node on IIS.
* Add support for HSTS headers. Technically, this isn't required to get Ghost running on Azure, [but you should probably do it anyway](https://www.hanselman.com/blog/HowToEnableHTTPStrictTransportSecurityHSTSInIIS7.aspx).

To see these changes in detail, [see the branch comparison](https://github.com/chadly/ghost/compare/ghost...azure?expand=1).
