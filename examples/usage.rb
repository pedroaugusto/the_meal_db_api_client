$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "the_meal_db_api_client"
require "pry"

separator = "\n\n====================================================================================================================="

puts "Searching by name"
meals = TheMealDbApiClient::Model::Meal.search_by_name "Arrabiata"
puts "Found #{meals.size} meal(s):"

puts meals.map(&:to_s).join(separator)

puts separator
puts "Searching by main ingredient"
meals = TheMealDbApiClient::Model::Meal.search_by_main_ingredient "chicken breast"
puts "Found #{meals.size} meal(s):"
puts meals.map(&:to_s).join(separator)

puts separator
puts "Loading full details of first meal."
puts "Before load:"
meal = meals.first
puts meal
puts separator

puts "After load:"
meal.reload!
puts meal
puts separator

puts "Finding by Id"
meal = TheMealDbApiClient::Model::Meal.find 52772
puts "Found:\n#{meal}"