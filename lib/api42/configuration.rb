module Api42
  module Configuration
    VALID_OPTIONS_KEYS = [
      :client_id,
      :client_secret,
      :site,
      :oauth_token
    ].freeze

    DEFAULT_CLIENT_ID     = nil
    DEFAULT_CLIENT_SECRET = nil
    DEFAULT_SITE          = 'https://api.intra.42.fr'.freeze

    attr_accessor *VALID_OPTIONS_KEYS

    def configure
      yield self
    end

    def self.extended(base)
      base.set_defaults
    end

    def options
      options = {}
      VALID_OPTIONS_KEYS.each { |k| options[k] = send(k) }
      options
    end
  
    def set_defaults
      self.client_id          = DEFAULT_CLIENT_ID
      self.client_secret      = DEFAULT_CLIENT_SECRET
      self.site               = DEFAULT_SITE
      self
    end
  end
end
