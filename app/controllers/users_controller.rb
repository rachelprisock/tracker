class UsersController < ApplicationController
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
    @income = Transaction.where(
        transaction_type_id: 1,
        transaction_date: DateTime.now.beginning_of_month..DateTime.now.end_of_month
    ).sum(:amount_in_dollars)
    emotion_groups = Emotion.where(
        created_at: DateTime.now.beginning_of_month..DateTime.now.end_of_month
    ).group(:emotion_type).count
    @emotion_groups = emotion_groups.transform_keys {|key| key.name}

    @smoking = Habit.where(
                        habit_type_id: 3,
                        created_at: DateTime.now.beginning_of_month..DateTime.now.end_of_month
    ).group_by_day(:created_at, time_zone: "UTC").count

    @time_habits = Habit.all.reject{|habit| habit.habit_type.name == "Smoking"}
  end
end
