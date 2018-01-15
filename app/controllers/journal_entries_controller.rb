class JournalEntriesController < ApplicationController
  before_action :authenticate_user!

  def new
    @journal_entry = JournalEntry.new
    @user = current_user
  end

  def create
    journal_entry = JournalEntry.new(journal_entry_params)
    if journal_entry.save!
      redirect_to journal_entry_path(journal_entry), success: "You've added a journal entry"
    else
      redirect_to new_journal_entry_path, danger: "Unable to save your journal entry"
    end
  end

  def show
    @journal_entry = JournalEntry.find(params[:id])
  end

  def index
    @journal_entries = JournalEntry.all
  end

  def edit
    @journal_entry = JournalEntry.find(params[:id])
    @user = current_user
  end

  def update
    @journal_entry = JournalEntry.find(params[:id])
    if @journal_entry.update_attributes!(journal_entry_params)
      redirect_to journal_entry_path(@journal_entry), flash: { success: "You have updated that journal entry." }
    else
      render 'edit'
    end
  end

  def destroy
    @journal_entry = JournalEntry.find(params[:id])
    if @journal_entry.destroy!
      redirect_to journal_entrys_path, flash: { success: "You have deleted that journal entry." }
    else
      redirect_to journal_entry_path(@journal_entry), flash: { danger: "There was an error deleting that journal entry." }
    end
  end

  private

  def journal_entry_params
    params.require(:journal_entry).permit(:title, :user_id, :entry)
  end
end
