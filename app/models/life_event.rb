class LifeEvent < ActiveRecord::Base
  belongs_to :category
  belongs_to :life_event_type
  belongs_to :user
end
