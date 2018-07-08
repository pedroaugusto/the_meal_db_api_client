FactoryBot.define do
  factory :ingredient, class: 'TheMealDbApiClient::Model::Ingredient' do
    name "Butter"
    measure "One spoon"

    skip_create
    initialize_with { new(*attributes.values) }
  end
end
