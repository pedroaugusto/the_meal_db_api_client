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

    # Search ingredients by name
    def self.search_by_name(name)
      @@search_by_name_request ||= TheMealDbApiClient::Requests::SearchMealsByName.new
      @@search_by_name_request.call(s: name)
    end

    # Instanciate a new Meal from hash params
    def self.from_hash(hash)
      meal = Meal.new *hash.fetch_values(*JSON_ATTRIBUTES)
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