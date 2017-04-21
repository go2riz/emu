module Emu
  module HTTPService
    class Request
      attr_reader :url, :args, :verb, :options

      def initialize(url:, verb:, args: {}, options: {})
        @url = url
        @verb = verb
        @args = args
        @options = options
      end

      def post_args
        verb == 'get' ? {} : args
      end
    end
  end
end
