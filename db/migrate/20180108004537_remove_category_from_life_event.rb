class RemoveCategoryFromLifeEvent < ActiveRecord::Migration
  def change
    remove_reference :life_events, :category, index: true, foreign_key: true
  end
end
