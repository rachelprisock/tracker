class HabitGoalTask < ActiveRecord::Base
  belongs_to :habit_type
  belongs_to :category
  belongs_to :goal
end
