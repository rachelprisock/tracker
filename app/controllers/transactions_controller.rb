class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
    @user = current_user
  end

  def create
    transaction = Transaction.new(transaction_params)
    if transaction.save!
      redirect_to transaction_path(transaction), success: "You've added an transaction"
    else
      redirect_to new_transaction_path, danger: "Unable to save your transaction"
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def index
    @transactions = Transaction.all
  end

  def edit
    @transaction = Transaction.find(params[:id])
    @user = current_user
  end

  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update_attributes!(transaction_params)
      redirect_to transaction_path(@transaction), flash: { success: "You have updated that transaction." }
    else
      render 'edit'
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    if @transaction.destroy!
      redirect_to transactions_path, flash: { success: "You have deleted that transaction." }
    else
      redirect_to transaction_path(@transaction), flash: { danger: "There was an error deleting that transaction." }
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:transaction_category_id, :transaction_type_id, :amount_in_dollars, :user_id, :required, :transaction_date)
  end
end
