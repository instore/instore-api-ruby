require 'oauth2'

module Instore
  class Client
    BASE_URL = 'https://api.instoredoes.com'

    def initialize(client_id, client_secret, options = {})
      options[:site] ||= BASE_URL
      options[:token_url] ||= '/oauth/access_token'

      @oauth_client = ::OAuth2::Client.new(client_id, client_secret, options)
    end

    def authorize_url(options = {})
      @oauth_client.auth_code.authorize_url(options)
    end

    def get_token(code)
      @oauth_client.auth_code.get_token(code)
    end
  end
end