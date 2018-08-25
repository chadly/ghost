# Ghost on Azure App Service

This is my fork of [Ghost 2.0](https://github.com/tryghost/ghost) with changes to run on Azure App Service. [Read here for a full introduction](https://www.chadly.net/ghost-on-azure/).

## Branches

This repo is setup with a few branches for easier maintenance. The `ghost` branch is where I commit the [Ghost releases](https://github.com/tryghost/ghost/releases) as they come out unchanged. The `azure` branch (the default branch) is where I make only the changes necessary to get it running on Azure App Service. I merge the `ghost` branch into this branch as new releases come out. I then create a separate branch for each site I deploy. This way I can make theme customizations and tweaks to individual sites and rebase those changes off of the `azure` branch.

### Changes on the Azure Branch

* Add a `db.js` file in the root to make it easy to initialize/migrate a SQLite database ([since I can't run the CLI tool on Azure](https://www.chadly.net/ghost-on-azure/#clitool)).
* Force `config.js` to get the port it should run on from `PORT` env variable instead of `SERVER_PORT`. This is to make iisnode happy.
* Add `web.config` & `iisnode.yml` - standard stuff to host node on IIS.
* Add support for HSTS headers. Technically, this isn't required to get Ghost running on Azure, [but you should probably do it anyway](https://www.hanselman.com/blog/HowToEnableHTTPStrictTransportSecurityHSTSInIIS7.aspx).

To see these changes in detail, [see the branch comparison](https://github.com/chadly/ghost/compare/ghost...azure).

## How to Run Locally

Make sure you have the [latest Node LTS release](https://nodejs.org/) installed. Install the [latest version of Yarn](https://yarnpkg.com/). Clone this repo and run the following in terminal:

```
yarn
yarn start
```

This will install dependencies and then start the Ghost development server. If you haven't already, Ghost will automatically setup your sqlite database in `/content/data/ghost.db` (or migrate it to the latest version if it already exists). You should see something like this in your terminal:

```
INFO Ghost is running in development...
INFO Listening on: 127.0.0.1:2368
INFO Url configured as: http://localhost:2368/
INFO Ctrl+C to shut down
INFO Ghost boot 3.455s
```

Open the configured URL in your web browser and you should see the default Ghost installation. Navigate to `/ghost` to setup the site.

Head on over to the [Ghost Development Documentation](https://ghost.org/developers/) for more information on how to setup and develop with Ghost.
