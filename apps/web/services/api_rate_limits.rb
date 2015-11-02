require 'httparty'

module Web::Services
  class ApiRateLimits
    BASE_URI = 'https://api.github.com/rate_limit'

    def fetch_data
      { remaining: parsed_response['remaining'], reset: parsed_response['reset'] }
    end

    private

    def parsed_response
      @parsed_response ||= api_response.parsed_response['resources']
    end

    def api_response
      HTTParty.get(BASE_URI, query: access_token)
    end

    def access_token
      { 'access_token' => Fasterer::Github.configuration.access_token }
    end
  end
end
