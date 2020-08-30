# frozen_string_literal: true

class CreateTransactionTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :transaction_types do |t|
      t.integer :code
      t.string :description
      t.boolean :income, default: true

      t.timestamps
    end
    add_index :transaction_types, :code
  end
end
