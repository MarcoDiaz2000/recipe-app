require 'rails_helper'

RSpec.describe 'foods/new.html.erb', type: :view do
  before do
    assign(:food, Food.new)
    render
  end

  it 'displays the name field' do
    expect(rendered).to have_selector("input[name='food[name]']")
    expect(rendered).to have_selector('label', text: 'Name')
  end

  it 'displays the measurement_unit field' do
    expect(rendered).to have_selector("input[name='food[measurement_unit]']")
    expect(rendered).to have_selector('label', text: 'Measurement unit')
  end

  it 'displays the price field' do
    expect(rendered).to have_selector("input[name='food[price]']")
    expect(rendered).to have_selector('label', text: 'Price')
  end

  it 'displays the quantity field' do
    expect(rendered).to have_selector("input[name='food[quantity]']")
    expect(rendered).to have_selector('label', text: 'Quantity')
  end

  it 'displays the Create Food submit button' do
    expect(rendered).to have_selector("input[type=submit][value='Create Food']")
  end
end
