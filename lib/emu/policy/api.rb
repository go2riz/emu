module Emu
  module Policy
    class API < Emu::API
      def api(url, args = {}, verb = 'get', options = {})
        raise AuthenticationError.new(nil, { message: "CMS API requires an access token" }) unless Emu::OAuth2.get_token

        super(Emu.policy_api_path, url, args, verb, options)
      end

      def create_policy_key(account_id)
        body = {
          "key-data": {
            "account-id": account_id,
            "apis": ["search"]
          }
        }
        api("accounts/#{account_id}/policy_keys", body, "post")
      end

      def get_policy(account_id, policy_key)
        api("accounts/#{account_id}/policy_keys/#{policy_key}")
      end
    end
  end
end
