# frozen_string_literal: true

FactoryBot.define do
  factory :store do
    name { FFaker::Company.name }
    owner_name { FFaker::NameBR.name }
  end
end
