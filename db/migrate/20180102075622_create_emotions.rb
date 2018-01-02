class CreateEmotions < ActiveRecord::Migration
  def change
    create_table :emotions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :emotion_severity, index: true, foreign_key: true
      t.references :emotion_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
