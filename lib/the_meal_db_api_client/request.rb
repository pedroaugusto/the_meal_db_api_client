# frozen_string_literal: true
module TheMealDbApiClient
  class Request
    BASE_URL = 'https://www.themealdb.com/api/json/v1/'
    FORMAT   = 'php'

    @@config ||= Configuration.new

    attr_reader :path, :params

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

    def manage_response(response)
      begin
        json = JSON.parse(response.body)
        convert_response(json)
      rescue JSON::ParserError
        raise TheMealDbApiClient::Error::ServerError.new, "Invalid JSON response from API server."
      end
    end

    def convert_response(json)
      array = json[@model::CLASS_KEY] || []
      array.map(&@model.method(:from_hash))
    end

    def validate_params(params)
      if params && params.any?
        params.each do |param, value|
          unless value.kind_of? @params[param]
            raise TheMealDbApiClient::Error::ValidationError.new, "Invalid param #{param} value."
          end
        end
      end
    end

    def build_url
      url = "#{BASE_URL}#{@@config.api_key}/#{@path}.#{FORMAT}"
    end

  end
end