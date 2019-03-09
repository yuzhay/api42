require 'api42/configuration'
require 'api42/client'

module Api42
  extend Configuration

  class << self
    attr_accessor :api_client

    def new(options = {}, &block)
      @api_client = Api42::Client.new(options, &block)
    end

    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private = false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end