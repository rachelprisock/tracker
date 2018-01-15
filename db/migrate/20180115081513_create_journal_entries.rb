class CreateJournalEntries < ActiveRecord::Migration
  def change
    create_table :journal_entries do |t|
      t.string :title
      t.references :user, index: true, foreign_key: true
      t.text :entry

      t.timestamps null: false
    end
  end
end
