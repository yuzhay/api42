require 'api42/v2/base'

module Api42
  module V2
    class Evaluations < Api42::V2::Base
      def initialize(options = {})
        super(options)
      end

      def get(id)
        get_request("/evaluations/#{id}")
      end

      def get_all(args={})
        get_request('/evaluations/', args)
      end
    end
  end
end
