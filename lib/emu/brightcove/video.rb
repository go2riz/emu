module Emu
  module Brightcove
    module Video
      def get_videos(account_id, args = {})
        api("v1/accounts/#{account_id}/videos", args)
      end
    end
  end
end
