class Transaction < ActiveRecord::Base
  belongs_to :transaction_type
  belongs_to :transaction_category
end
