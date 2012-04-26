RoR-bare-app-with-auth-using-Devise-2.0-and-OmniAuth-1.1.0
==========================================================

A RoR bare app with auth using Devise 2.0 and OmniAuth 1.1.0

# How to use
## Change the app name appears on code: 
* "RoRAppWithAuth" to "YourAppName"
* "ror_app_with_auth" to "your_app_name"

## Add Facebook APP ID and APP SECRET to config files:
* config/environments/development.rb
* config/environments/test.rb
* config/environments/production.rb

## Create database
$ rake db:create

## Migrate db schema
$ rake db:migrate

Done! Happy coding :)
