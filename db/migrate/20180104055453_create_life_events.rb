class CreateLifeEvents < ActiveRecord::Migration
  def change
    create_table :life_events do |t|
      t.references :category, index: true, foreign_key: true
      t.string :name
      t.text :description
      t.references :life_event_type, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
