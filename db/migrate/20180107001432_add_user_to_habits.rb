class AddUserToHabits < ActiveRecord::Migration
  def change
    add_reference :habits, :user, index: true, foreign_key: true
  end
end
