require 'faraday'
require 'faraday_middleware'
require 'emu/http_service/response'
require 'emu/http_service/request'

module Emu
  module HTTPService
    class << self
      # A customized stack of Faraday middleware that will be used to make each request
      attr_accessor :faraday_middleware
    end

    DEFAULT_MIDDLEWARE = Proc.new do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.request :oauth2, Emu::Oauth.get_token, token_type: "bearer"
      faraday.response :multi_json
    end

    # Makes request directly to Brightcove
    # @note You'll rarely need to call this method directly
    #
    # @param request a Emu::HTTPService::Request object
    #
    # @return [Emu::HTTPService::Response] a response object
    def self.make_request(request)
      conn = Faraday.new(Emu.api_path, &(faraday_middleware || DEFAULT_MIDDLEWARE))

      if request.verb == 'post'
        response = conn.post do |req|
          req.url request.url
          req.headers['Content-Type'] = 'application/json'
          req.body = request.post_args.to_json
        end
      else
        response = conn.send(request.verb, request.url, request.post_args)
      end

      Emu::HTTPService::Response.new(response.status.to_i, response.body, response.headers)
    end
  end
end
