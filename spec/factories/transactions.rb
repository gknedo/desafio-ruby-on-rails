# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    store { create(:store) }
    transaction_type { create(:transaction_type) }
    transacted_at { Time.zone.now }
    value { rand(100..999999) }
    cpf { FFaker::IdentificationBR.cpf }
    card { FFaker::Bank.card_number.delete(' ') }
  end
end
