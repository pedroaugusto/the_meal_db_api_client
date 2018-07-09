# frozen_string_literal: true
module TheMealDbApiClient
  class Request
    BASE_URL = 'https://www.themealdb.com/api/json/v1/'
    FORMAT   = 'php'

    @@config ||= Configuration.new

    attr_reader :path, :params

    # Executes the API call
    def call(params)
      validate_params(params)

      begin
        response = RestClient.get build_url, params: params
        manage_response(response)
      rescue RestClient::ExceptionWithResponse => e
        raise TheMealDbApiClient::Error::ServerError.new, e.response
      end
    end

    private

    # Fetch response body and parse it from JSON to Models
    def manage_response(response)
      begin
        json = JSON.parse(response.body)
        convert_response(json)
      rescue JSON::ParserError
        raise TheMealDbApiClient::Error::ServerError.new, "Invalid JSON response from API server."
      end
    end

    # Instantiate Models based on JSON attributes
    def convert_response(json)
      array = json[@model::CLASS_KEY] || []
      array.map(&@model.method(:from_hash))
    end

    # Validates id the request params are allowed
    def validate_params(params)
      if params && params.any?
        params.each do |param, value|
          unless value.kind_of? @params[param]
            raise TheMealDbApiClient::Error::ValidationError.new, "Invalid param #{param} value."
          end
        end
      end
    end

    # Build the URL to be called based on the internal variables
    def build_url
      url = "#{BASE_URL}#{@@config.api_key}/#{@path}.#{FORMAT}"
    end

  end
end