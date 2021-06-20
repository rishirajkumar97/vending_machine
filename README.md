# README

This README would normally document whatever steps are necessary to get the
application up and running.

* Ruby version
    Requires Ruby2.6.3
* System dependencies
    Ruby Installed
    Bundler Gem Installed

* Configuration

    Run `bundle install` to install the required packages
    Run the Following Commands to setup the DB:
    `rake db:create` - To Create the database
    `rake db:migrate` - To migrate the schema and related details
    Run `bin/rails s` to start the server then Navigate to localhost:3000 to check if server is running

* How to run the test suite

The Project uses RSpec for testing. To execute Rspec run:

`bundle exec rspec`

* Guide for Endpoints

/beverages - GET, GET by ID, DELETE by ID, POST
/ingredients - GET, Get by ID, DELETE by ID, POST , PUT 
/vend - GET by beverageID
