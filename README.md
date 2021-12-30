# Golfr Backend

This is the code for the Golfr app server.

## Setup

1. Go to `Actions` tab and enable workflows
2. Clone the repository
3. Install ruby 3.0.1 via rvm
4. `bundle install`
5. Copy `config/_sample_database.yml` to `config/database.yml`
6. `rails db:create db:migrate db:seed`
7. Start the server `rails s`

## Development

#### Running tests

`rspec`

#### Running the linter

`rubocop`
