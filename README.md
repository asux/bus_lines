# Bus Lines service

This is simple Rails 6.1 API-only application for booking bus tickets for passengers.

## Gems
 - Ruby 3.0.3
 - Rails 6.1.4
 - jwt
 - money-rails

For development & testing:
  - better_errors
  - brakeman
  - bundler-audit
  - database_cleaner
  - factory_bot_rails
  - ffaker
  - rspec-rails
  - rubocop and plugins
  - rubycritic
  - shoulda-matchers

## Database

SQL engine: SQLite3

To setup database, run:

```shell
bin/rails db:setup
```

## Tests

To run tests:

```shell
bundle exec rspec
```

## TODO

- [x] Setup code skeleton and testing
- [x] Create `User` model & resource
- [x] Create `Location` model & resource
- [x] Create `Line` model & resource
- [ ] Create `Ticket` model & resource
- [ ] Setup authentication
- [ ] Ability to filter lines by departure & arrival location, departure time
- [ ] Ability to book a ticket up to 30 minutes before departure
- [ ] Ability to refund ticket up to 30 minutes before departure
- [ ] Ability to add extra luggage
- [ ] Ability for Admin to have overview of tickets sold per departure and their total profits
