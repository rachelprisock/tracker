class CreateLifeEventTypes < ActiveRecord::Migration
  def change
    create_table :life_event_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
