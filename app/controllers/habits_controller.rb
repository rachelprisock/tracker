class HabitsController < ApplicationController
  before_action :authenticate_user!

  def new
    @habit = Habit.new
    @user = current_user
  end

  def create
    habit = Habit.new(habit_params)
    if habit.save!
      redirect_to habits_path, success: "You've added an habit"
    else
      redirect_to new_habit_path, danger: "Unable to save your habit"
    end
  end

  def show
    @habit = Habit.find(params[:id])
    @daily_amount = Habit.where(habit_type_id: @habit.habit_type_id, created_at: DateTime.now.beginning_of_day..DateTime.now.end_of_day).sum(:quantity)
  end

  def index
    @habits = Habit.all
  end

  def edit
    @habit = Habit.find(params[:id])
    @user = current_user
  end

  def update
    @habit = Habit.find(params[:id])
    if @habit.update_attributes!(habit_params)
      redirect_to habits_path, flash: { success: "You have updated that habit." }
    else
      render 'edit'
    end
  end

  def destroy
    @habit = Habit.find(params[:id])
    if @habit.destroy!
      redirect_to habits_path, flash: { success: "You have deleted that habit." }
    else
      redirect_to habit_path(@habit), flash: { danger: "There was an error deleting that habit." }
    end
  end

  private

  def habit_params
    params.require(:habit).permit(:habit_type_id, :date, :quantity, :user_id)
  end
end
