# frozen_string_literal: true

class Store < ApplicationRecord
  validates_presence_of :name, :owner_name
end
