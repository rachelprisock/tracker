class Habit < ActiveRecord::Base
  belongs_to :category
  belongs_to :habit_type
  belongs_to :user

  validates :date, presence: true
  validates :quantity, presence: true
end
