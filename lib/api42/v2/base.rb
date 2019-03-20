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
        http_response = response_block.call
        response = build_response(http_response)
        begin
          response.data = http_response.parsed
        rescue OAuth2::Error => e
          nil
        end
        response
      end



      private

      def build_response(response)
        OpenStruct.new(
          headers: response.headers,
          status: response.status,

          page_num: response.headers['x-page'].to_i,
          page_size: response.headers['x-per-page'].to_i,
          total: response.headers['x-total'].to_i,
          request_id: response.headers['x-request-id'],
          request_runtime: response.headers['x-runtime'].to_f,
          application_id: response.headers['x-application-id'].to_i,
          application_name: response.headers['x-application-name'],
          application_roles: response.headers['x-application-roles'],
          rates_hourly_limit: response.headers['x-hourly-ratelimit-limit'].to_i,
          rates_hourly_remaining: response.headers['x-hourly-ratelimit-remaining'].to_i,
          rates_secondly_limit: response.headers['x-secondly-ratelimit-limit'].to_i,
          rates_secondly_remaining: response.headers['x-secondly-ratelimit-remaining'].to_i,

          data: nil,
        )
      end

      def _with_prefix(url)
        "/v#{VERSION}#{url}"
      end
    end
  end
end
