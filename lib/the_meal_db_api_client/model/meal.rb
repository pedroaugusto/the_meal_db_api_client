# frozen_string_literal: true
module TheMealDbApiClient::Model
  class Meal
    include TheMealDbApiClient::Utils::Comparable

    CLASS_KEY = 'meals'

    JSON_ATTRIBUTES = %w(idMeal strMeal strArea strCategory strInstructions strMealThumb strTags strYoutube strSource dateModified)
    attr_reader :id, :name, :area, :category, :instructions, :thumb, :tags, :youtube, :source, :modified

    def initialize(*args)
      @id, @name, @area, @category, @instructions, @thumb, @tags, @youtube, @source, @modified = args
      @ingredients = []
    end

    # Get a copy of ingredients array
    def ingredients
      @ingredients.dup
    end

    # Search meals by name
    def self.search_by_name(name)
      @@search_by_name_request ||= TheMealDbApiClient::Requests::SearchMealsByName.new
      @@search_by_name_request.call(s: name)
    end

    # Search meals by main ingredient
    def self.search_by_main_ingredient(ingredient)
      @@search_by_main_ingredient_request ||= TheMealDbApiClient::Requests::SearchMealsByMainIngredient.new
      @@search_by_main_ingredient_request.call(i: ingredient)
    end

    # Find meal by Id
    def self.find(id)
      @@fetch_full_details_request ||= TheMealDbApiClient::Requests::FetchMealFullDetails.new
      @@fetch_full_details_request.call(i: id).first
    end

    # Fetch full details of a preloaded Meal
    def reload!
      meal = Meal.find(@id.to_i)

      if meal
        meal.instance_variables.each do |instance_variable|
          instance_variable_set(instance_variable, meal.instance_variable_get(instance_variable))
        end
        return true
      else
        return false
      end
    end

    # Instanciate a new Meal from hash params
    def self.from_hash(hash)
      meal = Meal.new *JSON_ATTRIBUTES.map(&hash.method(:[]))
      meal.build_ingredients(hash)
      meal
    end

    # Instanciate ingredients instances to add to this meal from hash params
    def build_ingredients(hash)
      (1..20).each do |number|
        ingredient_key = "strIngredient#{number}"
        measure_key    = "strMeasure#{number}"

        if TheMealDbApiClient::Utils::HashUtils.filled?(hash, ingredient_key) &&
           TheMealDbApiClient::Utils::HashUtils.filled?(hash, measure_key)
          @ingredients << Ingredient.new(*hash.fetch_values(ingredient_key, measure_key))
        end
      end
    end

    def state
      [@id, @name, @area, @category, @instructions, @thumb, @tags, @youtube, @source, @modified, @ingredients]
    end

  end
end