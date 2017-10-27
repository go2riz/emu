module Emu
  module CMS
    module Video
      # Gets a page of video objects
      #
      # limit, default: 20
      # @see https://brightcovelearning.github.io/Brightcove-API-References/cms-api/v1/doc/index.html#api-videoGroup-Get_Videos
      def get_videos(account_id, args = {})
        api("accounts/#{account_id}/videos", args)
      end

      # Gets count of videos for the account or a search
      def get_video_count(account_id, args = {})
        api("accounts/#{account_id}/counts/videos")
      end

      # Gets a video object
      #
      # @param account_id Video Cloud account ID
      # @param video_id   Video Cloud video ID or (ref:reference_id
      # accounts/account_id/videos/video_id
      # or
      # accounts/account_id/videos/ref:my_reference_id
      def get_video(account_id, video_id)
        api("accounts/#{account_id}/videos/#{video_id}")
      end

      # Gets an array of sources(renditions) for a video
      #
      # @param account_id Video Cloud account ID
      # @param video_id   Video Cloud video ID or (ref:reference_id
      # accounts/account_id/videos/video_id/sources
      # or
      # accounts/account_id/videos/ref:my_reference_id/sources
      def get_video_sources(account_id, video_id)
        api("accounts/#{account_id}/videos/#{video_id}/sources")
      end
    end
  end
end
