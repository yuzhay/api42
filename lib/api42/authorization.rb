require 'oauth2'

module Api42
  module Authorization
    def client(options={})
      @client ||= ::OAuth2::Client.new(
        client_id, 
        client_secret,
        site: options.fetch(:site) { Api42.site }
      )
    end

    def authenticated?
      token?
    end

    def get_token
      _verify
      @token = client.client_credentials.get_token
    end

    def token
      @token ||= get_token
    end

    private

    def _verify
      raise ArgumentError, 'Provide client_id and client_secret' unless client_id? && client_secret?
    end
  end
end