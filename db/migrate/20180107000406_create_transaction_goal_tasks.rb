class CreateTransactionGoalTasks < ActiveRecord::Migration
  def change
    create_table :transaction_goal_tasks do |t|
      t.references :transaction_category, index: true, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :goal_amount_in_dollars
      t.references :goal, index: true, foreign_key: true
      t.boolean :transaction_required

      t.timestamps null: false
    end
  end
end
