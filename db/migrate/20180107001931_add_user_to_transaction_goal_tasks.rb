class AddUserToTransactionGoalTasks < ActiveRecord::Migration
  def change
    add_reference :transaction_goal_tasks, :user, index: true, foreign_key: true
  end
end
