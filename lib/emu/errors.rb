module Emu
  class EmuError < StandardError; end

  class APIError < EmuError
    attr_accessor :http_status, :error_message

    def initialize(http_status, response_body)
      @http_status = http_status

      message = response_body["error_code"] || ""
      message += " #{response_body['message']}" if response_body["message"]
      message += " [HTTP #{http_status}]" if http_status

      @error_message = message
      super(@error_message)
    end
  end

  # Any error with 5xx HTTP status code
  class ServerError < APIError; end

  # Any error with a 4xx HTTP status code
  class ClientError < APIError; end

  class AuthenticationError < ClientError; end
end
