require 'rails_helper'

RSpec.describe 'foods/index.html.erb', type: :view do
  let(:food1) { create(:food, name: 'Banana', measurement_unit: 'Kg', price: 3) }
  let(:food2) { create(:food, name: 'Apple', measurement_unit: 'Kg', price: 4) }

  before do
    assign(:foods, [food1, food2])
    render
  end

  it 'displays a button to add a new food' do
    expect(rendered).to have_link('Add Food', href: new_food_path)
  end

  it 'displays the food table' do
    expect(rendered).to have_selector('table.table')

    expect(rendered).to have_content('Banana')
    expect(rendered).to have_content('Kg')
    expect(rendered).to have_content('3')

    expect(rendered).to have_content('Apple')
    expect(rendered).to have_content('Kg')
    expect(rendered).to have_content('4')
  end

  it 'displays a button to delete a food' do
    expect(rendered).to have_selector('.btn.btn-danger', count: 2)
  end
end
