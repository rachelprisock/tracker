class AddEnteredDateToHabits < ActiveRecord::Migration
  def change
    add_column :habits, :date, :date
  end
end
