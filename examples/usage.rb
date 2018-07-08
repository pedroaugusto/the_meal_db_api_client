$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "the_meal_db_api_client"
require "pry"

puts "Searching by name"
meals = TheMealDbApiClient::Model::Meal.search_by_name "Arrabiata"
puts "Found #{meals.size} meal(s)"

puts "Searching by main ingredient"
meals = TheMealDbApiClient::Model::Meal.search_by_main_ingredient "chicken breast"
puts "Found #{meals.size} meal(s)"

puts "Loading full details of first meal"
meal = meals.first
meal.reload!
puts meal.ingredients.size

puts "Finding by Id"
meal = TheMealDbApiClient::Model::Meal.find 52772
puts "Found #{meal.name}"