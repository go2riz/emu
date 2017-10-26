require 'connection_pool'
require 'redis'

module Emu
  class RedisConnection
    class << self
      def create(options={})
        options.keys.each do |key|
          options[key.to_sym] = options.delete(key)
        end
        options[:url] ||= determine_redis_provider

        size = options[:size] || 5
        pool_timeout = options[:pool_timeout] || 1
        ConnectionPool.new(:timeout => pool_timeout, :size => size) do
          build_client(options)
        end
      end

      def build_client(options)
        Redis.new options
      end

      def determine_redis_provider
        # If you have this in your environment:
        # MY_REDIS_URL=redis://hostname.example.com:1238/4
        # then set:
        # REDIS_PROVIDER=MY_REDIS_URL
        ENV[
          ENV['REDIS_PROVIDER'] || 'REDIS_URL'
        ]
      end
    end
  end
end
