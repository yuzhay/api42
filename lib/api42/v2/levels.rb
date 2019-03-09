require 'api42/v2/base'

module Api42
  module V2
    class Levels < Api42::V2::Base
      def initialize(options = {})
        super(options)
      end

      def get(id)
        get_request("/levels/#{id}")
      end

      def get_all(args={})
        get_request('/levels/', args)
      end
    end
  end
end
