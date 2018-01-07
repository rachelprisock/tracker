class CreateHabits < ActiveRecord::Migration
  def change
    create_table :habits do |t|
      t.references :category, index: true, foreign_key: true
      t.references :habit_type, index: true, foreign_key: true
      t.integer :time_in_minutes

      t.timestamps null: false
    end
  end
end
