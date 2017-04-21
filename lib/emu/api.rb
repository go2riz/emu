require 'emu/brightcove/video'

module Emu
  module Brightcove
    module API
      class << self
        include Video

        def api(path, args = {}, verb = 'get', options = {})
          raise AuthenticationError.new(nil, { message: "API requires an access token" }) unless Emu::Oauth.get_token.present?

          response = Emu.make_request(path, args, verb, options)

          if response.status.to_i >=400 && response.status.to_i < 500
            raise Emu::Brightcove::ClientError.new(response.status.to_i, response.body)
          end

          if response.status.to_i >= 500
            raise Emu::Brightcove::ServerError.new(response.status.to_i, response.body)
          end

          response
        end
      end
    end
  end
end
