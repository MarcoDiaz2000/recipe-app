RSpec.describe 'recipes/public_recipes.html.erb', type: :view do
  it 'displays public recipes' do
    user = create(:user)
    recipe1 = create(:recipe, user:, name: 'Public Recipe 1')

    assign(:recipes, [recipe1])
    render

    expect(rendered).to match(/Public Recipes/)
    expect(rendered).to match(/Public Recipe 1/)
    expect(rendered).to match(/Total food items/)
    expect(rendered).to match(/Total price/)
  end
end
