# Golfr Backend

This is the code for the Golfr app server.

## Setup

1. Clone the repository
2. Install ruby 3.0.1 via rvm
3. `bundle install`
3. Copy `config/_sample_database.yml` to `config/database.yml`
4. `rails db:create db:migrate db:seed`
5. Start the server `rails s`

## Development

#### Running tests

`rspec`

#### Running the linter

`rubocop`
