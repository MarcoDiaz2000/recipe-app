FactoryBot.define do
  factory :food do
    name { "Apple" }
    measurement_unit { "kg" }
    price { 5.0 }
    quantity { 10.0 }
    association :user
  end
end