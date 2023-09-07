FactoryBot.define do
  factory :recipe_food do
    quantity { 1.0 }
    association :recipe
    association :food
  end
end
