class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
