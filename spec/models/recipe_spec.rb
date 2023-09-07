require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let!(:user) { create(:user) }

  it "is valid with a name and a user" do
    recipe = create(:recipe, user: user)
    expect(recipe).to be_valid
  end

  it "is invalid without a name" do
    recipe = build(:recipe, name: nil)
    recipe.valid?
    expect(recipe.errors[:name]).to include("can't be blank")
  end

  it "belongs to a user" do
    recipe = create(:recipe, user: user)
    expect(recipe.user).to eq(user)
  end
end
