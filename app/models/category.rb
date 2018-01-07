class Category < ActiveRecord::Base
  has_many :life_events
  has_many :habits
end
