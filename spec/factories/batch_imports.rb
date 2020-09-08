# frozen_string_literal: true

FactoryBot.define do
  factory :batch_import do
    status { 1 }
    completed_at { Time.zone.now }
  end
end
