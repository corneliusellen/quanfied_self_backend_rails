FactoryBot.define do
  factory :meal do
    sequence(:name) {Faker::Food.dish}
  end
end
