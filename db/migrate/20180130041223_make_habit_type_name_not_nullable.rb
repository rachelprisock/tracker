class MakeHabitTypeNameNotNullable < ActiveRecord::Migration
  def change
    change_column_null :habit_types, :name, false
  end
end
