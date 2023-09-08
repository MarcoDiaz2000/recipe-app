require 'rails_helper'

RSpec.feature 'Recipes', type: :feature do
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
  end

  scenario 'Creating a new recipe' do
    visit new_recipe_path

    fill_in 'recipe_name', with: 'Spaghetti Carbonara'
    fill_in 'recipe_preparation_time', with: '30'
    fill_in 'recipe_cooking_time', with: '60'
    fill_in 'recipe_description', with: 'Classic Italian pasta dish.'

    click_button 'Submit'

    expect(page).to have_content('An app for all your favorite recipes')
    expect(page).to have_content('Spaghetti Carbonara')
    expect(page).to have_content('Classic Italian pasta dish.')
  end
end
