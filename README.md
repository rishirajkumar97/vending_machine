# README

This README would normally document whatever steps are necessary to get the
application up and running.

This Project with the idea in mind that the User/Admin would be able to populate any number of beverages along with its required ingredients as future proof. Also the Assumption is taken that we only delete the Beverage first and if no beverage uses that ingredient then only a Ingredient can be deleted.

- Ruby version
  Requires ruby-2.6.3
- System dependencies
  Ruby Installed
  Bundler Gem Installed

- Configuration

  Run `bundle install` to install the required packages
  Run the Following Commands to setup the DB:
  `rake db:create` - To Create the database
  `rake db:migrate` - To migrate the schema and related details
  Run `bin/rails s` to start the server then Navigate to localhost:3000 to check if server is running

- How to run the test suite

The Project uses RSpec for testing. To execute Rspec run:

`bundle exec rspec`

- Guide for Endpoints

* /beverages - GET Endpoint to get the List of All the Beverages
* /beverage - POST endpoint to create a new beverage
* /beverages/{beverageId} - GET To get the details about that particular beverage
* /beverages/{beverageId} - DELETE To Delete a Beverage


* /ingredients - GET Endpoint to get the list of all ingredients
* /ingredients - POST Endpoint to create a new beverage
* /ingredients/{ingredientId} - GET Endpoint to get the details of a specific ingredient
* /ingredients/{ingredientId} - PUT Endpoint to Refill the Inventory

* /vend - GET by beverageID Dispenses a beverage associated with the provided beverage id.

For In depth Swagger Please Visit api/swagger.yml for JSON Response Structures.


