# frozen_string_literal: true

class Store < ApplicationRecord
  validates_presence_of :name, :owner_name

  has_many :transactions

  def balance
    transactions.reduce(0) { |sum, transaction| sum + transaction.signed_value }
  end

  def as_json(options = {})
    super(options).merge({ balance: balance })
  end
end
