module Emu
  module Ingest
    class API < Emu::API
      def api(url, args = {}, verb = 'get', options = {})
        raise AuthenticationError.new(nil, { message: "Inguest API requires an access token" }) unless Emu::OAuth2.get_token

        super(Emu.ingest_api_path, url, args, verb, options)
      end

      def ingest_request(account_id, video_id, args = {})
        api("accounts/#{account_id}/videos/#{video_id}/ingest-requests", args, "post")
      end
    end
  end
end
