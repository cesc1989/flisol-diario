# Custom Deployment Scripts

Ideally, you want to deploy your application to Heroku. It's the simplest way to release a Ruby on Rails application.

However, when you need something more customized or your app is hosted in a VPS, then you're going to need to code some scripts to deploy your app.

The scripts in this section are useful to have a Capistrano-like deployment. These scripts work best if you configure them to be run by a CI server after merging changes to a set branch.

## Folder Structure

The scripts assume the following folder structure:

```
~/flisol_diario # Main folder to hold Rails app and related ones.
├── app # This is the folder that contains the Rails app.
├── deployment_logs # All logs for every deployment step.
└── deployments # The deployment have to happen in a separate place that is synched afterwards.
    ├── api-gems # Install gems here and symlink them to the expected folder.
    └── api-release # Pull latest changes here and sync them to the api/ folder using RSync.
├── backups # Holds all database backups.
├── db # holds the SQLite database file.
```

## Scripts

First make a manual `git clone` to the repo from the `~/flisol_diario/deployments/api-release` folder.

```
git clone git@gh:cesc1989/flisol-diario.git .
```

After that the deployment process should be able to do its thing.

1. deploy_api.sh
2. pull_repo.sh
3. after_deploy.sh
4. application_start.sh

The first one, `deploy_api.sh` takes care of running the rest of the scripts.
