class TransactionGoalTask < ActiveRecord::Base
  belongs_to :transaction_category
  belongs_to :goal
end
