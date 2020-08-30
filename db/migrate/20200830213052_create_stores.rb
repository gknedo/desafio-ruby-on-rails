# frozen_string_literal: true

class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :owner_name

      t.timestamps
    end
  end
end