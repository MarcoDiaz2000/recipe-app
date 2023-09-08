# spec/features/recipes_spec.rb

require 'rails_helper'

RSpec.feature 'Recipes', type: :feature do
  let(:user) { create(:user) }
  # before(:each) do
  #   @user = FactoryBot.create(:user)
  #   login_as(@user, scope: :user)
  # end

  scenario 'Creating a new recipe' do
    login_as(@user, scope: :user)
    visit new_recipe_path

    fill_in 'Name', with: 'Spaghetti Carbonara'
    fill_in 'Preparation time', with: '30'
    fill_in 'Cooking time', with: '60'
    fill_in 'Description', with: 'Classic Italian pasta dish.'

    click_button 'Submit'

    expect(page).to have_content('Recipe saved successfully') # Check the redirected page
    expect(page).to have_content('Spaghetti Carbonara')
    expect(page).to have_content('Classic Italian pasta dish.')
  end

  scenario 'Viewing a recipe' do
    recipe = FactoryBot.create(:recipe, user: @user)

    visit recipe_path(recipe)

    expect(page).to have_content(recipe.name)
    expect(page).to have_content(recipe.description)
  end

  # Add more scenarios for testing other features here...
end
