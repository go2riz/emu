require 'emu/cms/video'
require 'emu/cms/asset'

class Emu::CMS::API < Emu::API
  include Emu::CMS::Video, Emu::CMS::Asset
  def api(url, args = {}, verb = 'get', options = {})
    raise AuthenticationError.new(nil, { message: "CMS API requires an access token" }) unless Emu::OAuth2.get_token

    super(Emu.cms_api_path, url, args, verb, options)
  end
end
