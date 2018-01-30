class RemoveMinutesAddQuantityToHabits < ActiveRecord::Migration
  def change
    remove_column :habits, :time_in_minutes
    add_column  :habits, :quantity, :integer, default:1, null:false
    change_column_null :habits, :habit_type_id, null:false
    change_column_null :habits, :user_id, null:false
  end
end
