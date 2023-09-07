require 'rails_helper'

RSpec.describe "recipes/index.html.erb", type: :view do
  it "displays a link to create a new recipe" do
    assign(:recipes, [])
    render
    expect(rendered).to match /New recipe/
  end

  it "displays all existing recipes" do
    user = create(:user)
    recipe1 = create(:recipe, name: "Recipe 1", description: "Description 1", user: user)
    recipe2 = create(:recipe, name: "Recipe 2", description: "Description 2", user: user)

    assign(:recipes, [recipe1, recipe2])
    render

    expect(rendered).to match /Recipe 1/
    expect(rendered).to match /Description 1/
    expect(rendered).to match /Recipe 2/
    expect(rendered).to match /Description 2/
  end
end
