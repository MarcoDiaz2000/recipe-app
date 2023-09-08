require 'rails_helper'

RSpec.feature 'Foods', type: :feature do
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
  end

  scenario 'Creating a new food' do
    visit new_food_path

    fill_in 'food_name', with: 'Banana'
    fill_in 'food_measurement_unit', with: 'piece'
    fill_in 'food_price', with: '0.5'
    fill_in 'food_quantity', with: '5'

    click_button 'Create Food'

    expect(page).to have_content('An app for all your favorite recipes.')
    expect(page).to have_content('Banana')
    expect(page).to have_content('piece')
  end

  scenario 'Viewing a list of foods' do
    food1 = FactoryBot.create(:food, user:)
    food2 = FactoryBot.create(:food, user:)

    visit foods_path

    expect(page).to have_content(food1.name)
    expect(page).to have_content(food2.name)
  end

  scenario 'Deleting a food' do
    food = FactoryBot.create(:food, user:)

    visit foods_path

    expect(page).to have_content(food.name)

    click_link 'Delete'

    expect(page).to have_content('An app for all your favorite recipes.')
    expect(page).not_to have_content(food.name)
  end
end
