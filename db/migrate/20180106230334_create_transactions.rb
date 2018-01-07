class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :transaction_type, index: true, foreign_key: true
      t.references :transaction_category, index: true, foreign_key: true
      t.integer :amount_in_dollars
      t.boolean :required

      t.timestamps null: false
    end
  end
end
