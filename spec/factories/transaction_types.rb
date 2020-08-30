# frozen_string_literal: true

FactoryBot.define do
  factory :transaction_type do
    sequence :code
    description { FFaker::Lorem.phrase }
    income { true }
  end
end
