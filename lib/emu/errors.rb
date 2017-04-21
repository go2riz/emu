module Emu
  class EmuError < StandardError; end

  module Brightcove
    class APIError < ::Emu::EmuError
      attr_accessor :http_status, :error_message

      def initialize(http_status, response_body)
        @http_status = http_status
        @error_message = response_body["error_code"] + ": " + response_body["message"]

        message = @error_message
        message += " [HTTP #{http_status}]" if http_status

        super(message)
      end
    end

    # Any error with 5xx HTTP status code
    class ServerError < APIError; end

    # Any error with a 4xx HTTP status code
    class ClientError < APIError; end

    class AuthenticationError < ClientError; end
  end
end
