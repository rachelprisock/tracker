class AddNameToTransactionGoalTasks < ActiveRecord::Migration
  def change
    add_column :transaction_goal_tasks, :name, :string
  end
end
