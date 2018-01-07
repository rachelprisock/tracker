class AddUserToHabitGoalTasks < ActiveRecord::Migration
  def change
    add_reference :habit_goal_tasks, :user, index: true, foreign_key: true
  end
end
