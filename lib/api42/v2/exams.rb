require 'api42/v2/base'

module Api42
  module V2
    class Exams < Api42::V2::Base
      def initialize(options = {})
        super(options)
      end

      def get(id)
        get_request("/exams/#{id}")
      end

      def get_all(args={})
        get_request('/exams/', args)
      end
    end
  end
end
