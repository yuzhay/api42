require 'api42/configuration'
require 'api42/authorization'

module Api42
  class Base
    include Authorization

    attr_reader *Configuration::VALID_OPTIONS_KEYS

    def initialize(options={}, &block)
      super()
      setup options
      set_api_client
      client if client_id? && client_secret?

      self.instance_eval(&block) if block_given?
    end

    def setup(options={})
      options = Api42.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    class_eval do
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        define_method "#{key}=" do |arg|
          self.instance_variable_set("@#{key}", arg)
          Api42.send("#{key}=", arg)
        end
      end
    end

    def set_api_client
      Api42.api_client = self
    end

    def method_missing(method, *args, &block)
      case method.to_s
      when /^(.*)\?$/
        return !self.send($1.to_s).nil?
      else
        super
      end
    end
  end
end