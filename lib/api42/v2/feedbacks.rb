require 'api42/v2/base'

module Api42
  module V2
    class Feedbacks < Api42::V2::Base
      def initialize(options = {})
        super(options)
      end

      def get(id)
        get_request("/feedbacks/#{id}")
      end

      def get_all(args={})
        get_request('/feedbacks/', args)
      end
    end
  end
end
