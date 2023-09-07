FactoryBot.define do
  factory :recipe do
    name { "Spaghetti" }
    preparation_time { 15 }
    cooking_time { 45 }
    description { "Delicious spaghetti with marinara sauce." }
    public { true }
    association :user
  end
end