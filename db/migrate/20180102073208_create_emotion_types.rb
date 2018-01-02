class CreateEmotionTypes < ActiveRecord::Migration
  def change
    create_table :emotion_types do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
