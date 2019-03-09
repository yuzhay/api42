require 'api42/base'

module Api42
  module V2
    class Base < Api42::Base
      VERSION = 2

      def initialize(options = {})
        super(options)
      end

      %w(get post put delete).each do |method|
        define_method "#{method}_request" do |path, args = {}|
          safe_response( 
            -> { 
              token.public_send(
                method, 
                _with_prefix(path),
                params: args
              ) 
            } 
          )
        end
      end

      def safe_response(response_block)
        begin
          response_block.call.parsed
        rescue OAuth2::Error => e
          nil
        end
      end

      private

      def _with_prefix(url)
        "/v#{VERSION}#{url}"
      end
    end
  end
end
