require 'redis'

class Emu::Configuration
  attr_accessor :client_id
  attr_accessor :client_secret

  # Brightcove site url
  #
  # Default: https://data.brightcove.com/
  attr_accessor :site

  # Brightcove token url
  #
  # Default: https://oauth.brightcove.com/v3/access_token
  attr_accessor :token_url

  # Emu's connection to Redis
  #
  # Default: localhost:6379/0
  attr_accessor :redis

  # A prefix for all keys Emu uses.
  #
  # Default: emu
  attr_accessor :redis_prefix

  # Api path for Brightcove api
  #
  # Default: https://cms.api.brightcove.com/v1/
  attr_accessor :api_path

  def initialize
    @redis          = Redis.new
    @redis_prefix   = :emu
    @site           = "https://data.brightcove.com/"
    @token_url      = "https://oauth.brightcove.com/v3/access_token"
    @api_path       = "https://cms.api.brightcove.com/v1"
  end
end
