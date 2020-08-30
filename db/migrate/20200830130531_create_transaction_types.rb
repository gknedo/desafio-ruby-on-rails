class CreateTransactionTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :transaction_types do |t|
      t.integer :type
      t.string :description
      t.boolean :income, default: true

      t.timestamps
    end
    add_index :transaction_types, :type
  end
end
