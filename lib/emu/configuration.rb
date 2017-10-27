require 'redis'
require "emu/redis_connection"

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
  attr_accessor :cms_api_path
  attr_accessor :policy_api_path
  attr_accessor :playback_api_path

  def initialize
    @redis              = Emu::RedisConnection.create
    @redis_prefix       = :emu
    @site               = "https://data.brightcove.com/"
    @token_url          = "https://oauth.brightcove.com/v3/access_token"
    @cms_api_path       = "https://cms.api.brightcove.com/v1"
    @policy_api_path    = "https://policy.api.brightcove.com/v1"
    @playback_api_path  = "https://edge.api.brightcove.com/playback/v1"
  end

  def redis=(hash)
    @redis = if hash.is_a?(ConnectionPool)
      hash
    else
      Emu::RedisConnection.create(hash)
    end
  end
end
