class CreateEmotionSeverities < ActiveRecord::Migration
  def change
    create_table :emotion_severities do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
