# Emu

Emu is a lightweight Brightcove CMS api library for ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'emu'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install emu

## Configuration

```ruby
require 'redis'

Emu.configure do |config|
  # Emu's connection to Redis
  # 
  # Default: localhost:6379/0
  config.redis = Redis.new(host: 'localhost', port: '6379', db: 0)

  # Brightcove site url
  #
  # Default: https://data.brightcove.com/
  config.site = "https://data.brightcove.com/"

  # Brightcove token url
  #
  # Default: https://oauth.brightcove.com/v3/access_token
  config.token_url = "https://oauth.brightcove.com/v3/access_token"

  # A prefix for all keys Emu uses.
  #
  # Default: emu
  config.redis_prefix = :emu

  # Api path for Brightcove api
  #
  # Default: https://cms.api.brightcove.com/v1/
  config.api_path = "https://cms.api.brightcove.com/v1/"

  config.client_id = <brightcove_client_id>

  config.client_secret = <brightcove_client_secret>
end

## Development


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/memghongli/emu. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

