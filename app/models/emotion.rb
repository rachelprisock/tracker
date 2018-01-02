class Emotion < ActiveRecord::Base
  belongs_to :emotion_type
  belongs_to :emotion_severity
  belongs_to :user
end
