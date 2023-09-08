require 'rails_helper'

RSpec.feature 'RecipesIndex', type: :feature do
  let(:user) { User.create!(email: 'test@example.com', name: 'Marco', password: 'password') }
  let(:recipe1) { Recipe.create!(name: 'Spaghetti', description: 'Tasty!', user:) }
  let(:recipe2) { Recipe.create!(name: 'Pizza', description: 'Delicious!', user:) }

  before do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    recipe1
    recipe2
  end

  scenario "user sees a list of their recipes and can navigate to 'New Recipe' page" do
    visit recipes_path

    expect(page).to have_content('Spaghetti')
    expect(page).to have_content('Pizza')

    expect(page).to have_link('New recipe', href: new_recipe_path)
    click_link 'New recipe'
    expect(current_path).to eq(new_recipe_path)
  end
end
