class HabitsController < ApplicationController
  def new
    @habit = Habit.new
    @user = current_user
  end

  def create
    habit = Habit.new(habit_params)
    if habit.save!
      redirect_to habit_path(habit), success: "You've added an habit"
    else
      redirect_to new_habit_path, danger: "Unable to save your habit"
    end
  end

  def show
    @habit = Habit.find(params[:id])
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
      redirect_to habit_path(@habit), flash: { success: "You have updated that habit." }
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
    params.require(:habit).permit(:category_id, :habit_type_id, :time_in_minutes, :user_id)
  end
end
