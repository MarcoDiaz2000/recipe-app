require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let!(:recipe) { create(:recipe) }
  let!(:food) { create(:food) }

  it "is valid with a recipe and a food" do
    recipe_food = create(:recipe_food, recipe: recipe, food: food)
    expect(recipe_food).to be_valid
  end

  it "sets a default quantity of 1" do
    recipe_food = create(:recipe_food)
    expect(recipe_food.quantity).to eq(1)
  end
end
