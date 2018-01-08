class RemoveCategoryFromHabit < ActiveRecord::Migration
  def change
    remove_reference :habits, :category, index: true, foreign_key: true
  end
end
