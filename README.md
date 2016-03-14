# LoggingByBean

I've grown tired of looking through Rails logs and wanted something more
readable.  I found a nice treatment of this at https://cbpowell.wordpress.com/2013/08/09/beautiful-logging-for-ruby-on-rails-4/,
but I wanted something that was truly fire-and-forget.  This gem handles the 
installation of an initializer and modification of the application.rb file
to use nicer logging.

NOTE:  This is my first gem, and I'm doing this as much to learn how to
generate gems as anything else.  Apologies if it's clunky.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'logging_by_bean'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install logging_by_bean

Then run the installer:

    $ rails generator logging_by_bean:install

## Usage

Once you've rebundled with the gem and run the installation, you're good to go.
The gem consists of two side effects:  it creates a logging_by_bean.rb initializer
file and it modifies your application.rb to switch out the default Rails logger.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/logging_by_bean/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
