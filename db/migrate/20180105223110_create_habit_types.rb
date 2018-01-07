class CreateHabitTypes < ActiveRecord::Migration
  def change
    create_table :habit_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
