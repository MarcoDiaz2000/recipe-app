require 'rails_helper'

RSpec.feature 'FoodsIndex', type: :feature do
  let(:user) { User.create!(email: 'test@example.com', name: 'Marco', password: 'password') }

  before do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  scenario 'user can delete a food item' do
    food = Food.create!(name: 'Apple', measurement_unit: 'Kg', price: 1.5, user:)

    visit foods_path

    expect(page).to have_link('Delete', href: food_path(food))
    click_link 'Delete'

    expect(page).not_to have_content('Apple')
    expect(page).not_to have_content('Kg')
    expect(page).not_to have_content(1.5)
  end

  scenario 'user can create a new food item' do
    visit new_food_path

    fill_in 'Name', with: 'Apple'
    fill_in 'Measurement unit', with: 'Kg'
    fill_in 'Price', with: 1.5
    fill_in 'Quantity', with: 10

    click_button 'Create Food'

    expect(page).to have_content('Apple')
    expect(page).to have_content('Kg')
    expect(page).to have_content('1.5')
  end
end

RSpec.feature 'FoodsIndex', type: :feature do
  let(:user) { User.create!(email: 'test@example.com', name: 'Marco', password: 'password') }

  before do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  scenario "user sees a list of foods and can navigate to 'Add Food' page" do
    Food.create!(name: 'Apple', measurement_unit: 'Kg', price: 1.5, user:)
    Food.create!(name: 'Banana', measurement_unit: 'Kg', price: 2.0, user:)

    visit foods_path

    expect(page).to have_content('Apple')
    expect(page).to have_content('Kg')
    expect(page).to have_content(1.5)

    expect(page).to have_link('Add Food', href: new_food_path)
    click_link 'Add Food'
    expect(current_path).to eq(new_food_path)
  end

  scenario 'user can delete a food item' do
    food = Food.create!(name: 'Apple', measurement_unit: 'Kg', price: 1.5, user:)

    visit foods_path

    expect(page).to have_link('Delete', href: food_path(food))
    click_link 'Delete'

    expect(page).not_to have_content('Apple')
    expect(page).not_to have_content('Kg')
    expect(page).not_to have_content(1.5)
  end
end
