class EmotionsController < ApplicationController
  def new
    @emotion = Emotion.new
    @user = current_user
  end

  def create
    user = User.find(params[:emotion][:user_id])
    emotion_type = EmotionType.find(params[:emotion][:emotion_type])
    emotion_severity = EmotionSeverity.find(params[:emotion][:emotion_severity])

    emotion = Emotion.new(user: user, emotion_type: emotion_type, emotion_severity: emotion_severity)
    if emotion.save!
      redirect_to emotion_path(emotion), success: "You've added an emotion"
    else
      redirect_to new_emotion_path, danger: "Unable to save your information"
    end
  end

  def show
    @emotion = Emotion.find(params[:id])
  end
end
