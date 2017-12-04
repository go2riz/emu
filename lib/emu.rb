# include emu modules
require "emu/errors"
require "emu/api"
require "emu/CMS/api"
require "emu/policy/api"
require "emu/playback/api"
require "emu/ingest/api"
require "emu/oauth2"

require "emu/http_service"
require "emu/configuration"
require "emu/version"
require "emu/redis_connection"

module Emu
  # A Ruby client library for Brightcove CMS API.

  class << self
    def configure
      yield config
    end

    # Allows you to control various Emu configuration options.
    # See Emu::Configuration
    def config
      @config ||= Configuration.new
    end

    def redis
      raise ArgumentError, "requires a block" unless block_given?
      config.redis.with do |conn|
        yield conn
      end
    end

    def cms_api_path
      config.cms_api_path
    end

    def policy_api_path
      config.policy_api_path
    end

    def playback_api_path
      config.playback_api_path
    end

    def ingest_api_path
      config.ingest_api_path
    end
  end

  def self.make_request(api_path, url, args, verb, options = {},  policy_key = nil)
    HTTPService.make_request(api_path, HTTPService::Request.new(url: url, args: args, verb: verb, options: options), policy_key)
  end
end
