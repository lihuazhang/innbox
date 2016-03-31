# Mails

Mountable Personal Messaging Engine for any Rails application.

[![Gem Version](https://badge.fury.io/rb/mails.svg)](https://badge.fury.io/rb/mails) [![Build Status](https://travis-ci.org/rails-engine/mails.svg)](https://travis-ci.org/rails-engine/mails) [![Code Climate](https://codeclimate.com/github/rails-engine/mails/badges/gpa.svg)](https://codeclimate.com/github/rails-engine/mails) [![codecov.io](https://codecov.io/github/rails-engine/mails/coverage.svg?branch=master)](https://codecov.io/github/rails-engine/mails?branch=master) [![](http://inch-ci.org/github/rails-engine/mails.svg?branch=master)](http://inch-ci.org/github/rails-engine/mails?branch=master)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mails'
```

And then execute:

    $ bundle

Now you have the generators available in Rails application:

```bash
$ rails g mails:install
```

You can also generate views and controller if you need to customize them:

```bash
$ rails g mails:views
$ rails g mails:controllers
```

Then mount it in routes.rb:

```ruby
mount Mails::Engine, at: "/mails"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/mails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
