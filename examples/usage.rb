$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "the_meal_db_api_client"
require "pry"

# puts "Searching by name"
# meals = TheMealDbApiClient::Model::Meal.search_by_name "Arrabiata"

# puts "Found #{meals.size} meal(s)"

# meals.each do |meal|
#   puts "This meal has #{meal.ingredients.size} ingredient(s)"
# end

puts "Searching by main ingredient"
meals = TheMealDbApiClient::Model::Meal.search_by_main_ingredient "chicken breast"

puts "Found #{meals.size} meal(s)"

meals.each do |meal|
  puts meal.name
  puts "This meal has #{meal.ingredients.size} ingredient(s)"
end