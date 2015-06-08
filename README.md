## README

### Steps to get up and running

*Dependencies:* [Docker, docker-compose, possibly boot2docker](https://docs.docker.com/installation/)

Ensure the `docker-compose.yml` file has the right environment. Change port `456` to whatever port you want the app to be accessible at. Set up your .env file in root by making a copy of `docker/dot-env-template`.

Run the following commands (in this order):
```bash

# Ensure our volumes are built before doing anything
docker-compose build

# Run bundle install, purge files and set up the database
docker-compose run web sudo -u app bin/setup

# Compile the assets (only required for production)
docker run tasker_web_1 sudo -u app rake RAILS_ENV=production assets:precompile

# Run the app
docker-compose up web -d
```

# Backing up the database
```shell
# Backs up to backup/db_YYYY-MM-DD.sql
bin/db_backup.rb

# Add to crontab (defaults to 2AM)
bin/db_backup.rb cron [hour]
```
