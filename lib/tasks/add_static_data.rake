namespace :add_static_data do
  desc "Add emotion severity levels"
  task to_emotion_severities: :environment do
    EmotionSeverity.create(name: "For an Hour or Less", description: "Used for an emotion that is felt for a short period of time.")
    EmotionSeverity.create(name: "For a Few Hours", description: "Used for an emotion that is felt for a moderate period of time.")
    EmotionSeverity.create(name: "All Day", description: "Used for an emotion that is felt for an extended period of time.")
  end
end
