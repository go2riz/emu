module Emu
  module Brightcove
    module Asset
      # Adds a asset file for a remote asset.
      # note: you can use ref:reference_id instead of video_id
      def add_asset(asset_type, account_id, video_id, args = {})
        raise ArgumentError, "remote_url must be presented" unless args[:remote_url] || args["remote_url"]
        api("accounts/#{account_id}/videos/#{video_id}/assets/#{asset_type}", args, "post")
      end

      # Gets the poster file for a give video
      # Note: you can only add one poster for a video
      # Note: you can use ref:reference_id instead of video_id
      def get_asset_list(asset_type, account_id, video_id)
        api("accounts/#{account_id}/videos/#{video_id}/assets/#{asset_type}")
      end

      # Adds a poster file for a remote asset.
      # note: you can use ref:reference_id instead of video_id
      def update_asset(asset_type, account_id, video_id, asset_id, args = {})
        raise ArgumentError, "remote_url must be presented" unless args[:remote_url] || args["remote_url"]
        api("accounts/#{account_id}/videos/#{video_id}/assets/#{asset_type}/#{asset_id}", args, "patch")
      end

      def delete_asset(asset_type, account_id, video_id, asset_id, args = {})
        api("accounts/#{account_id}/videos/#{video_id}/assets/#{asset_type}/#{asset_id}", args, "delete")
      end

      def method_missing(m, *args, &block)
        action, asset_type = m.to_s.split("_", 2)
        case action
        when "add"
          add_asset(asset_type, *args)
        when "get"
          asset_type = asset_type.split("_")
          if asset_type.size > 1
            get_asset_list(asset_type.first, *args)
          end
        when "update"
          update_asset(asset_type, *args)
        when "delete"
          delete_asset(asset_type, *args)
        end
      end
    end
  end
end
