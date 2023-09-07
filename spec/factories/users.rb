FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "test#{n}@example.com"
    end
    password { 'password' }
    name { 'Marco' }
  end
end
