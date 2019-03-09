require 'api42/v2/base'

module Api42
  module V2
    class Users < Api42::V2::Base
      def initialize(options = {})
        super(options)
      end

      def get(id)
        get_request("/users/#{id}")
      end

      def get_all(args={})
        get_request('/users/', args)
      end
    end
  end
end
