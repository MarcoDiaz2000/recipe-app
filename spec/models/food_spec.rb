require 'rails_helper'

RSpec.describe Food, type: :model do
  let!(:user) { create(:user) }

  it 'is valid with a name and a user' do
    food = create(:food, user:)
    expect(food).to be_valid
  end

  it 'is invalid without a name' do
    food = build(:food, name: nil)
    food.valid?
    expect(food.errors[:name]).to include("can't be blank")
  end

  it 'belongs to a user' do
    food = create(:food, user:)
    expect(food.user).to eq(user)
  end
end
