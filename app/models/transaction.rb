# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :store
  belongs_to :transaction_type

  validates_presence_of :card, :cpf, :transacted_at, :value
  validates :value, numericality: { only_integer: true, greater_than: 0 }
end
