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
```
## Video
```ruby
require 'emu'

api = Emu::Brightcove::API.new

# Get a page of videos
#
# limit, default: 20
# @see https://brightcovelearning.github.io/Brightcove-API-References/cms-api/v1/doc/index.html#api-videoGroup-Get_Videos
api.get_videos("57838016001")

# Get video count
api.get_video_count("57838016001")

# Get a video
#
# @param account_id Video Cloud account ID
# @param video_id   Video Cloud video ID or (ref:reference_id
# accounts/account_id/videos/video_id or
# accounts/account_id/videos/ref:my_reference_id
api.get_video("57838016001", "4492075574001")
```

## Asset
```ruby
require 'emu'

api = Emu::Brightcove::API.new

# Adds a poster file for a remote asset.
# note: you can use ref:reference_id instead of video_id
api.add_poster(57838016001, 4665727869001, {
  remote_url: "http://learning-services-media.brightcove.com/images/great-blue-heron-poster.png"
})

# Adds a thumbnail file for a remote asset.
# note: you can use ref:reference_id instead of video_id
api.add_thumbnail(57838016001, 4665727869001, {
  remote_url: "http://learning-services-media.brightcove.com/images/great-blue-heron-thumbnail.png"
})

# Gets the poster file for a give video
# Note: you can only add one poster for a video
# Note: you can use ref:reference_id instead of video_id
api.get_poster_list(57838016001, 4665727869001)
```
## Development


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/memghongli/emu. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

