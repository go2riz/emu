require 'emu/brightcove/video'

module Emu
  module Brightcove
    class API
      include Video

      def api(path, args = {}, verb = 'get', options = {})
        raise AuthenticationError.new(nil, { message: "API requires an access token" }) unless Emu::Oauth2.get_token.present?

        response = Emu.make_request(path, args, verb, options)

        if response.status.to_i >=400 && response.status.to_i < 500
          raise ClientError.new(response.status.to_i, response.body)
        end

        if response.status.to_i >= 500
          raise ServerError.new(response.status.to_i, response.body)
        end

        response
      end
    end
  end
end
