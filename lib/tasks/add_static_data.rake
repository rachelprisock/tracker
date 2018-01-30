namespace :add_static_data do
  desc "Add emotion severity levels"
  task to_emotion_severities: :environment do
    EmotionSeverity.create(name: "For an Hour or Less", description: "Used for an emotion that is felt for a short period of time.")
    EmotionSeverity.create(name: "For a Few Hours", description: "Used for an emotion that is felt for a moderate period of time.")
    EmotionSeverity.create(name: "All Day", description: "Used for an emotion that is felt for an extended period of time.")
  end

  desc 'Add emotion types as defined by Robert Plutchik'
  task to_emotion_types: :environment do
    EmotionType.create(name: 'Angry', description: 'Feeling angry. A stronger word for anger is rage.')
    EmotionType.create(name: 'Afraid', description: 'Feeling of being afraid.')
    EmotionType.create(name: 'Sad', description: 'Feeling sad. Other words are sorrow, grief or depression.')
    EmotionType.create(name: 'Happy', description: 'feeling happy. Other words are happiness, gladness.')
    EmotionType.create(name: 'Disgusted', description: 'Feeling something is wrong or nasty.')
    EmotionType.create(name: 'Surprised', description: 'Being unprepared for something.')
    EmotionType.create(name: 'Trusting', description: 'A positive emotion; admiration is stronger; acceptance is weaker.')
    EmotionType.create(name: 'Anticipating', description: 'In the sense of looking forward positively to something which is going to happen. Expectation is more neutral.')
  end

  desc 'Add Categories'
  task to_categories: :environment do
    Category.create(name: "Wellness")
    Category.create(name: "Career")
    Category.create(name: "Financial")
  end

  desc 'Add LifeEventTypes'
  task to_life_event_types: :environment do
    LifeEventType.create(name: "Work")
    LifeEventType.create(name: "Life")
  end

  desc 'Add HabitTypes'
  task to_habit_types: :environment do
    HabitType.create(name: "Exercise")
    HabitType.create(name: "Meditation")
    HabitType.create(name: "Smoking")
    HabitType.create(name: "Coding")
    HabitType.create(name: "Reading")
  end

  desc 'Add TransactionTypes'
  task to_transaction_types: :environment do
    TransactionType.create(name: "Income")
    TransactionType.create(name: "Spending")
  end

  desc 'Add TransactionCategories'
  task to_transaction_categories: :environment do
    TransactionCategory.create(name: "Eating Out")
    TransactionCategory.create(name: "Groceries")
    TransactionCategory.create(name: "Rent")
    TransactionCategory.create(name: "Bills")
    TransactionCategory.create(name: "Bars")
    TransactionCategory.create(name: "Liquor Stores")
    TransactionCategory.create(name: "Cigarettes")
    TransactionCategory.create(name: "Clothes Shopping")
    TransactionCategory.create(name: "Other Shopping")
    TransactionCategory.create(name: "Gifts")
    TransactionCategory.create(name: "Gas")
    TransactionCategory.create(name: "Smoking Cessation")
    TransactionCategory.create(name: "Paycheck")
    TransactionCategory.create(name: "Contracting")
  end

  desc 'make date not null'
  task make_date_not_null: :environment do
    habits = Habit.all
    habits.each do |habit|
      habit.update_attributes(date:habit.created_at)
    end
  end
end
