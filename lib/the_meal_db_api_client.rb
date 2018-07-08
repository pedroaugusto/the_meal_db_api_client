# frozen_string_literal: true
require 'rest-client'
require 'json'

module TheMealDbApiClient
  autoload :VERSION, 'the_meal_db_api_client/version'
  autoload :Request, 'the_meal_db_api_client/request'
  autoload :Configuration, 'the_meal_db_api_client/configuration'

  module Model
    autoload :Meal, 'the_meal_db_api_client/model/meal'
    autoload :Ingredient, 'the_meal_db_api_client/model/ingredient'
  end

  module Requests
    autoload :SearchMealsByName, 'the_meal_db_api_client/requests/search_meals_by_name'
  end

  module Utils
    autoload :HashUtils, 'the_meal_db_api_client/utils/hash_utils'
    autoload :Comparable, 'the_meal_db_api_client/utils/comparable'
  end

  module Error
    autoload :ValidationError, 'the_meal_db_api_client/error/validation_error'
    autoload :ServerError, 'the_meal_db_api_client/error/server_error'
  end

end
