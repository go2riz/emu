require 'uri'
require 'faraday'

module Emu
  module HTTPService
    class ParamsEncoder < Faraday::Middleware
      CONTENT_TYPE = 'Content-Type'.freeze

      class << self
        attr_accessor :mime_type
      end

      self.mime_type = 'application/json'.freeze

      def call(env)
        env[:url].query = URI.unescape(env[:url].query) unless env[:url].query.nil?
        @app.call(env)
      end

    end
  end
end

Faraday::Request.register_middleware :params_encoder => Emu::HTTPService::ParamsEncoder
