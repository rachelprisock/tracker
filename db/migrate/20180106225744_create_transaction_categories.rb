class CreateTransactionCategories < ActiveRecord::Migration
  def change
    create_table :transaction_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
