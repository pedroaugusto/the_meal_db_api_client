# frozen_string_literal: true
module TheMealDbApiClient::Requests
  class SearchMealsByMainIngredient < TheMealDbApiClient::Request

    def initialize
      @path  = 'filter'
      @params = { i: String }
      @model = TheMealDbApiClient::Model::Meal
    end
  end
end
