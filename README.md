# GHKeys - GitHub Keys

GitHub Keys gem allows you to fetch users keys in the simplest way. It uses web scraping because of GH API limits.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ghkeys'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ghkeys

## Usage

```ruby
require 'ghkeys'

GHKeys('axvm')
=> #array of strings
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/axvm/ghkeys.
