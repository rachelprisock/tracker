class GoalsController < ApplicationController
  def new
    @goal = Goal.new
    @user = current_user
  end

  def create
    goal = Goal.new(goal_params)
    if goal.save!
      redirect_to goal_path(goal), success: "You've added an goal"
    else
      redirect_to new_goal_path, danger: "Unable to save your goal"
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def index
    @goals = Goal.all
  end

  def edit
    @goal = Goal.find(params[:id])
    @user = current_user
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update_attributes!(goal_params)
      redirect_to goal_path(@goal), flash: { success: "You have updated that goal." }
    else
      render 'edit'
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    if @goal.destroy!
      redirect_to goals_path, flash: { success: "You have deleted that goal." }
    else
      redirect_to goal_path(@goal), flash: { danger: "There was an error deleting that goal." }
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :start_date, :end_date, :user_id)
  end
end
