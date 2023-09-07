require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a valid email and password" do
    user = create(:user)
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end
end
