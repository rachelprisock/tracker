class EmotionsController < ApplicationController
  def new
    @emotion = Emotion.new
    @user = current_user
  end

  def create
     emotion = Emotion.new(emotion_params)
    if emotion.save!
      redirect_to emotion_path(emotion), success: "You've added an emotion"
    else
      redirect_to new_emotion_path, danger: "Unable to save your information"
    end
  end

  def show
    @emotion = Emotion.find(params[:id])
  end

  def index
    @emotions = Emotion.where(user_id: current_user.id)
  end

  def edit
    @emotion = Emotion.find(params[:id])
    @user = current_user
  end

  def update
    @emotion = Emotion.find(params[:id])
    if @emotion.update_attributes!(emotion_params)
      redirect_to emotion_path(@emotion), flash: { success: "You have updated that emotion." }
    else
      render 'edit'
    end
  end

  def destroy
    @emotion = Emotion.find(params[:id])
    if @emotion.destroy!
      redirect_to emotions_path, flash: { success: "You have deleted that emotion." }
    else
      redirect_to emotion_path(@emotion), flash: { danger: "There was an error deleting that emotion." }
    end
  end

  private

  def emotion_params
    params.require(:emotion).permit(:emotion_severity_id, :emotion_type_id, :user_id)
  end
end
