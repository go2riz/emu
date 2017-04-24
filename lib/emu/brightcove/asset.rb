module Emu
  module Brightcove
    module Asset
      # Adds a poster file for a remote asset.
      # note: you can use ref:reference_id instead of video_id
      def add_poster(account_id, video_id, args = {})
        raise ArgumentError, "remote_url must be presented" unless args[:remote_url] || args["remote_url"]
        api("accounts/#{account_id}/videos/#{video_id}/assets/poster", args, "post")
      end

      # Adds a thumbnail file for a remote asset.
      # note: you can use ref:reference_id instead of video_id
      def add_thumbnail(account_id, video_id, args = {})
        raise ArgumentError, "remote_url must be presented" unless args[:remote_url] || args["remote_url"]
        api("accounts/#{account_id}/videos/#{video_id}/assets/thumbnail", args, "post")
      end
    end
  end
end
