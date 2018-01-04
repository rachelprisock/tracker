namespace :add_static_data do
  desc "Add emotion severity levels"
  task to_emotion_severities: :environment do
    EmotionSeverity.create(name: "For an Hour or Less", description: "Used for an emotion that is felt for a short period of time.")
    EmotionSeverity.create(name: "For a Few Hours", description: "Used for an emotion that is felt for a moderate period of time.")
    EmotionSeverity.create(name: "All Day", description: "Used for an emotion that is felt for an extended period of time.")
  end

  desc 'Add emotion types as defined by Robert Plutchik'
  task to_emotion_types: :environment do
    EmotionType.create(name: 'Anger', description: 'Feeling angry. A stronger word for anger is rage.')
    EmotionType.create(name: 'Fear', description: 'Feeling of being afraid.')
    EmotionType.create(name: 'Sadness', description: 'Feeling sad. Other words are sorrow, grief or depression.')
    EmotionType.create(name: 'Joy', description: 'feeling happy. Other words are happiness, gladness.')
    EmotionType.create(name: 'Disgust', description: 'Feeling something is wrong or nasty.')
    EmotionType.create(name: 'Surprise', description: 'Being unprepared for something.')
    EmotionType.create(name: 'Trust', description: 'A positive emotion; admiration is stronger; acceptance is weaker.')
    EmotionType.create(name: 'Anticipation', description: 'In the sense of looking forward positively to something which is going to happen. Expectation is more neutral.')
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
end
