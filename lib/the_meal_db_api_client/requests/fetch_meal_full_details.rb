# frozen_string_literal: true
module TheMealDbApiClient::Requests
  class FetchMealFullDetails < TheMealDbApiClient::Request

    def initialize
      @path  = 'lookup'
      @params = { i: Integer }
      @model = TheMealDbApiClient::Model::Meal
    end
  end
end
