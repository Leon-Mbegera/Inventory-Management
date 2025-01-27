# Name
Giga Inventory Management

## Description
This is a simple inventory management system for an ordinary retail store. Administrators can define products, and proceed to make sales for those products. The system keeps track of stocks for each product, and ensures sales made account for the quantities of stock on the retail. Users also get notified in the event of attempting a sale whose quantity is insufficient, or in the event these quantities drop below the allowed low stock level particular for each product.

## Setup
The app is just a simple rails application therefore it does not require any extra setup. The general setup steps are:
 - clone the application

 - Run `bundle install` to install any missing gems
 - Run `rails db:migrate` to migrate the database
 - Run `rails assets:precompile` to compile js assets
 - Run `bin/dev` to start server

## Architecture
The app consists of just two models, i.e: product, and sale


## Testing:
A test suite is included to ensure that the solution works as expected

Run Unit & Integration tests with

- Run `rails test` to run tests

## Contributions and License:
  Contributions to this open-source project are welcome. Feel free to open issues or submit pull requests.
