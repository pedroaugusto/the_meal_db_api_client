FactoryBot.define do
  factory :meal, class: 'TheMealDbApiClient::Model::Meal' do
    id 1
    name "Scrambled eggs"
    area nil
    category nil
    instructions nil
    thumb nil
    tags nil
    youtube nil
    source nil
    modified nil

    skip_create
    initialize_with { new(*attributes.values) }

    trait :with_ingredients do
      after(:build) do |meal|
        meal.instance_variable_set("@ingredients", [build(:ingredient)])
      end
    end

    trait :with_all_fields do
      id 1
      name "Scrambled eggs"
      area "American"
      category "HFLC"
      instructions "Put the butter on a fridge along with the eggs and mix it."
      thumb "www.somewhere.com"
      tags "HFLC,Eggs,Simple"
      youtube "www.youtube.com"
      source nil
      modified nil
    end
  end
end
