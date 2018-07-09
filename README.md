# TheMealDbApiClient

Here are some instruction on how to use this ruby Gem

## Usage

### Install dependencies

```
cd the_meal_db_api_client
gem install bundler
bundle install
```

### Run examples at **/examples**

Please take a look at the examples to see how to use the classes.

```
ruby examples/usage.rb
```

### Run specs
```
bundle exec rspec
```

## Searching Meals by name

```ruby
TheMealDbApiClient::Model::Meal.search_by_name "Arrabiata"
=> [ <#TheMealDbApiClient::Model::Meal @id=1 ...>, <#TheMealDbApiClient::Model::Meal @id=2 ...>, ... ]
```

## Searching Meals by Main Ingredient

```ruby
TheMealDbApiClient::Model::Meal.search_by_main_ingredient "chicken breast"
=> [ <#TheMealDbApiClient::Model::Meal @id=1 ...>, <#TheMealDbApiClient::Model::Meal @id=2 ...>, ... ]
```

## Loading Full Details of a Meal

```ruby
meal.reload!
=> true

meal.area
=> "Italian"
```

## Thank You

> pedro.augusto.sb@gmail.com
