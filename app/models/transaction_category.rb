class TransactionCategory < ActiveRecord::Base
  has_many :transactions
  has_many :transaction_goal_tasks
end
