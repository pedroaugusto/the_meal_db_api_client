# frozen_string_literal: true
module TheMealDbApiClient::Requests
  class SearchMealsByName < TheMealDbApiClient::Request

    def initialize
      @path  = 'search'
      @params = { s: String }
      @model = TheMealDbApiClient::Model::Meal
    end
  end
end
