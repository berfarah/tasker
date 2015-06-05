## README

### Steps to get up and running

*Dependencies:* [Docker, docker-compose, possibly boot2docker](https://docs.docker.com/installation/)

Ensure the `docker-compose.yml` file has the right environment. Change port `456` to whatever port you want the app to be accessible at. Set up your .env file in root by making a copy of `docker/dot-env-template`.

Run the following commands (in this order):
```bash

# Ensure our volumes are built before doing anything
docker-compose build

# This is saved in a volume, so subsequent times of running this will be faster
docker-compose run web sudo -u app bundle install

# Set up the database
docker-compose run web sudo -u app RAILS_ENV=your_environment rake db:setup

# Compile the assets (only required for production)
docker-compose run web sudo -u app RAILS_ENV=production rake assets:precompile
```
