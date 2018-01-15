class HabitGoalTasksController < ApplicationController
  before_action :authenticate_user!

  def new
    @habit_goal_task = HabitGoalTask.new
    @user = current_user
  end

  def create
    habit_goal_task = HabitGoalTask.new(habit_goal_task_params)
    if habit_goal_task.save!
      redirect_to habit_goal_task_path(habit_goal_task), success: "You've added an habit goal task"
    else
      redirect_to new_habit_goal_task_path, danger: "Unable to save your habit goal task"
    end
  end

  def show
    @habit_goal_task = HabitGoalTask.find(params[:id])
  end

  def index
    @habit_goal_tasks = HabitGoalTask.all
  end

  def edit
    @habit_goal_task = HabitGoalTask.find(params[:id])
    @user = current_user
  end

  def update
    @habit_goal_task = HabitGoalTask.find(params[:id])
    if @habit_goal_task.update_attributes!(habit_goal_task_params)
      redirect_to habit_goal_task_path(@habit_goal_task), flash: { success: "You have updated that habit goal task." }
    else
      render 'edit'
    end
  end

  def destroy
    @habit_goal_task = HabitGoalTask.find(params[:id])
    if @habit_goal_task.destroy!
      redirect_to habit_goal_tasks_path, flash: { success: "You have deleted that habit goal task." }
    else
      redirect_to habit_goal_task_path(@habit_goal_task), flash: { danger: "There was an error deleting that habit goal task." }
    end
  end

  private

  def habit_goal_task_params
    params.require(:habit_goal_task).permit(:name, :user_id, :habit_type_id, :category_id, :start_date, :end_date, :goal_time_in_minutes, :goal_id)
  end
end
