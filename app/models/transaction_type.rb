# frozen_string_literal: true

class TransactionType < ApplicationRecord
  validates_presence_of :description, :code

  has_many :transactions

  def signal
    return -1 unless income?

    1
  end
end
