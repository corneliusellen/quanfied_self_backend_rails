FactoryBot.define do
  factory :food do
    sequence(:name) {Faker::Food.ingredient}
    sequence(:calories) {Faker::Number.between(10, 1000)}
  end
end
