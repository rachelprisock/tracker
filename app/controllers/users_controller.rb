class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user

    @spending = Transaction.where(
        transaction_type_id: 2,
        transaction_date: DateTime.now.beginning_of_month..DateTime.now.end_of_month
    ).group(
        :transaction_date
    ).sum(
        :amount_in_dollars
    )
    @total_spent = @spending.values.inject { |a, b| a + b }
    if @total_spent.nil?
      @total_spent = 0
    end
    @income = Transaction.where(
        transaction_type_id: 1,
        transaction_date: DateTime.now.beginning_of_month..DateTime.now.end_of_month
    ).sum(:amount_in_dollars)
    emotion_groups = Emotion.where(
        created_at: DateTime.now.beginning_of_month..DateTime.now.end_of_month
    ).group(:emotion_type).count
    @emotion_groups = emotion_groups.transform_keys {|key| key.name}

    habit_groups =  Habit.where(
                        date: DateTime.now.beginning_of_month..DateTime.now.end_of_month
    ).group(:habit_type_id).group_by_day(:date).count
    @habits = {}
    habit_groups.each do |id_date, count|
      id_date[0] = HabitType.find(id_date[0]).name
      @habits[id_date] = count
    end

    @time_habits = Habit.all.reject{|habit| habit.habit_type.name == "Smoking"}
  end
end
