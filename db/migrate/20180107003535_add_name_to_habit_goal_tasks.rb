class AddNameToHabitGoalTasks < ActiveRecord::Migration
  def change
    add_column :habit_goal_tasks, :name, :string
  end
end
