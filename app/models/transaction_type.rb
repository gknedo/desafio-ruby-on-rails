# frozen_string_literal: true

class TransactionType < ApplicationRecord
  validates_presence_of :description, :code
end
