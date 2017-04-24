require 'emu/brightcove/video'
require 'emu/brightcove/asset'

module Emu
  module Brightcove
    class API
      include Video, Asset

      def api(url, args = {}, verb = 'get', options = {})
        raise AuthenticationError.new(nil, { message: "API requires an access token" }) unless Emu::OAuth2.get_token

        response = Emu.make_request(url, args, verb, options)

        if response.status.to_i >=400 && response.status.to_i < 500
          raise ClientError.new(response.status.to_i, response.body.first)
        end

        if response.status.to_i >= 500
          raise ServerError.new(response.status.to_i, response.body.first)
        end

        response
      end
    end
  end
end
