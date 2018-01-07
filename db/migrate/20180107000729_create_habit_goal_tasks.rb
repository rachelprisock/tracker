class CreateHabitGoalTasks < ActiveRecord::Migration
  def change
    create_table :habit_goal_tasks do |t|
      t.references :habit_type, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :goal_time_in_minutes
      t.references :goal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
