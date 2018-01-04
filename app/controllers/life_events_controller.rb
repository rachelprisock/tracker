class LifeEventsController < ApplicationController
  def new
    @life_event = LifeEvent.new
    @user = current_user
  end

  def create
    life_event = LifeEvent.new(life_event_params)
    if life_event.save!
      redirect_to life_event_path(life_event), success: "You've added an life event"
    else
      redirect_to new_life_event_path, danger: "Unable to save your life event"
    end
  end

  def show
    @life_event = LifeEvent.find(params[:id])
  end

  def index
    @life_events = LifeEvent.where(user_id: current_user.id)
  end

  def edit
    @life_event = LifeEvent.find(params[:id])
    @user = current_user
  end

  def update
    @life_event = LifeEvent.find(params[:id])
    if @life_event.update_attributes!(life_event_params)
      redirect_to life_event_path(@life_event), flash: { success: "You have updated that life event." }
    else
      render 'edit'
    end
  end

  def destroy
    @life_event = LifeEvent.find(params[:id])
    if @life_event.destroy!
      redirect_to life_events_path, flash: { success: "You have deleted that life event." }
    else
      redirect_to life_event_path(@life_event), flash: { danger: "There was an error deleting that life event." }
    end
  end

  private

  def life_event_params
    params.require(:life_event).permit(:category_id, :name, :description, :life_event_type_id, :user_id)
  end
end
