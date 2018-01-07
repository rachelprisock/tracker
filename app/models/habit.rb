class Habit < ActiveRecord::Base
  belongs_to :category
  belongs_to :habit_type
end
