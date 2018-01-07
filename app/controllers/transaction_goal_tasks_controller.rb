class TransactionGoalTasksController < ApplicationController
  def new
    @transaction_goal_task = TransactionGoalTask.new
    @user = current_user
  end

  def create
    transaction_goal_task = TransactionGoalTask.new(transaction_goal_task_params)
    if transaction_goal_task.save!
      redirect_to transaction_goal_task_path(transaction_goal_task), success: "You've added an transaction goal task"
    else
      redirect_to new_transaction_goal_task_path, danger: "Unable to save your transaction goal task"
    end
  end

  def show
    @transaction_goal_task = TransactionGoalTask.find(params[:id])
  end

  def index
    @transaction_goal_tasks = TransactionGoalTask.all
  end

  def edit
    @transaction_goal_task = TransactionGoalTask.find(params[:id])
    @user = current_user
  end

  def update
    @transaction_goal_task = TransactionGoalTask.find(params[:id])
    if @transaction_goal_task.update_attributes!(transaction_goal_task_params)
      redirect_to transaction_goal_task_path(@transaction_goal_task), flash: { success: "You have updated that transaction goal task." }
    else
      render 'edit'
    end
  end

  def destroy
    @transaction_goal_task = TransactionGoalTask.find(params[:id])
    if @transaction_goal_task.destroy!
      redirect_to transaction_goal_tasks_path, flash: { success: "You have deleted that transaction goal task." }
    else
      redirect_to transaction_goal_task_path(@transaction_goal_task), flash: { danger: "There was an error deleting that transaction goal task." }
    end
  end

  private

  def transaction_goal_task_params
    params.require(:transaction_goal_task).permit(:name, :user_id, :transaction_category_id, :start_date, :end_date, :goal_amount_in_dollars, :goal_id, :transaction_required)
  end
end
