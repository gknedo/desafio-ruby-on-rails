class CreateBatchImports < ActiveRecord::Migration[6.0]
  def change
    create_table :batch_imports do |t|
      t.integer :status
      t.datetime :completed_at
      t.timestamps
    end
  end
end
