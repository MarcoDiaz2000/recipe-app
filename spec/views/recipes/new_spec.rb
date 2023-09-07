RSpec.describe "recipes/new.html.erb", type: :view do
  it "displays a form to create a new recipe" do
    assign(:recipe, Recipe.new)
    render

    expect(rendered).to match /New Recipe/
    expect(rendered).to match /Name/
    expect(rendered).to match /Preparation time/
    expect(rendered).to match /Cooking time/
    expect(rendered).to match /Description/
  end
end
