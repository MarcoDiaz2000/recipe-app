require 'rails_helper'

RSpec.feature 'RecipeFoods', type: :feature do
  let(:user) { User.create!(email: 'test@example.com', name: 'Marco', password: 'password') }
  let(:recipe1) { Recipe.create!(name: 'Spaghetti', description: 'Tasty!', user:) }

  before do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  scenario 'User sees the form to add a new ingredient' do
    visit new_recipe_recipe_food_path(recipe1)

    expect(page).to have_content('Add Ingredient to Recipe')
    expect(page).to have_selector('form')
    expect(page).to have_selector("input[type=submit][value='Add Ingredient to Recipe']")
  end
end
