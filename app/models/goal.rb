class Goal < ActiveRecord::Base
  has_many :transaction_goal_tasks
end
