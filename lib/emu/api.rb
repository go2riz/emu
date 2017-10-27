class Emu::API

  def api(api_path, url, args = {}, verb = 'get', options = {}, policy_key = nil)
    response = Emu.make_request(api_path, url, args, verb, options, policy_key)

    if response.status.to_i >=400 && response.status.to_i < 500
      raise Emu::ClientError.new(response.status.to_i, response.body[0])
    end

    if response.status.to_i >= 500
      raise Emu::ServerError.new(response.status.to_i, response.body[0])
    end

    response
  end
end
