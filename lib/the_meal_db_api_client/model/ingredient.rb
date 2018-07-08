# frozen_string_literal: true
module TheMealDbApiClient::Model
  class Ingredient
    include TheMealDbApiClient::Utils::Comparable

    attr_reader :name, :measure

    def initialize(*args)
      @name, @measure = args
    end

    def state
      [@name, @measure]
    end

  end
end
