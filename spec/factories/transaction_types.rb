FactoryBot.define do
  factory :transaction_type do
    sequence :type
    description { FFaker::Lorem.phrase }
    income { true }
  end
end
