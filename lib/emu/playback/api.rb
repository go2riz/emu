module Emu
  module Playback
    class API < Emu::API
      def api(policy_key, url, args = {}, verb = 'get', options = {})
        super(Emu.playback_api_path, url, args, verb, options, policy_key)
      end

      def get_videos(account_id, policy_key, args = {})
        api(policy_key, "accounts/#{account_id}/videos", args)
      end
    end
  end
end
