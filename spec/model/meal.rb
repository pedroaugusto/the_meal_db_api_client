require 'spec_helper'

RSpec.describe TheMealDbApiClient::Model::Meal do

  describe 'search_by_name' do

    let(:meal) { build(:meal, :with_all_fields, :with_ingredients) }

    let(:body) do
      {
        "meals" => [
          {
            "idMeal" => 1,
            "strMeal" => "Scrambled eggs",
            "strArea" => "American",
            "strCategory" => "HFLC",
            "strInstructions" => "Put the butter on a fridge along with the eggs and mix it.",
            "strMealThumb" => "www.somewhere.com",
            "strTags" => "HFLC,Eggs,Simple",
            "strYoutube" => "www.youtube.com",
            "strIngredient1" => "Butter",
            "strMeasure1" => "One spoon",
            "strIngredient2" => "",
            "strMeasure2" => "",
            "strIngredient3" => "",
            "strMeasure3" => "",
            "strIngredient4" => "",
            "strMeasure4" => "",
            "strIngredient5" => "",
            "strMeasure5" => "",
            "strIngredient6" => "",
            "strMeasure6" => "",
            "strIngredient7" => "",
            "strMeasure7" => "",
            "strIngredient8" => "",
            "strMeasure8" => "",
            "strIngredient9" => "",
            "strMeasure9" => "",
            "strIngredient10" => "",
            "strMeasure10" => "",
            "strIngredient11" => "",
            "strMeasure11" => "",
            "strIngredient12" => nil,
            "strMeasure12" => nil,
            "strIngredient13" => nil,
            "strMeasure13" => nil,
            "strIngredient14" => nil,
            "strMeasure14" => nil,
            "strIngredient15" => nil,
            "strMeasure15" => nil,
            "strIngredient16" => nil,
            "strMeasure16" => nil,
            "strIngredient17" => nil,
            "strMeasure17" => nil,
            "strIngredient18" => nil,
            "strMeasure18" => nil,
            "strIngredient19" => nil,
            "strMeasure19" => nil,
            "strIngredient20" => nil,
            "strMeasure20" => nil,
            "strSource" => nil,
            "dateModified" => nil
          }
        ]
      }.to_json
    end

    let(:response) { double "Response", body: body }

    before do
      allow(RestClient).to receive(:get) { response }
    end

    it "Maps the server response to models" do
      expect(described_class.search_by_name('Anything')).to eq([meal])
    end
  end

  describe 'search_by_main_ingredient' do

    let(:meal1) { build(:meal, id: 1, name: 'meal1', thumb: 'thumb1') }
    let(:meal2) { build(:meal, id: 2, name: 'meal2', thumb: 'thumb2') }

    let(:body) do
      {
        "meals" => [
          {
            "idMeal" => 1,
            "strMeal" => "meal1",
            "strMealThumb" => "thumb1",
          },
          {
            "idMeal" => 2,
            "strMeal" => "meal2",
            "strMealThumb" => "thumb2",
          }
        ]
      }.to_json
    end

    let(:response) { double "Response", body: body }

    before do
      allow(RestClient).to receive(:get) { response }
    end

    it "Maps the server response to models" do
      expect(described_class.search_by_main_ingredient('Anything')).to eq([meal1, meal2])
    end
  end

end