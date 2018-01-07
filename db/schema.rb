# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180107003535) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emotion_severities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "emotion_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "emotions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "emotion_severity_id"
    t.integer  "emotion_type_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "emotions", ["emotion_severity_id"], name: "index_emotions_on_emotion_severity_id"
  add_index "emotions", ["emotion_type_id"], name: "index_emotions_on_emotion_type_id"
  add_index "emotions", ["user_id"], name: "index_emotions_on_user_id"

  create_table "goals", force: :cascade do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "goals", ["user_id"], name: "index_goals_on_user_id"

  create_table "habit_goal_tasks", force: :cascade do |t|
    t.integer  "habit_type_id"
    t.integer  "category_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "goal_time_in_minutes"
    t.integer  "goal_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id"
    t.string   "name"
  end

  add_index "habit_goal_tasks", ["category_id"], name: "index_habit_goal_tasks_on_category_id"
  add_index "habit_goal_tasks", ["goal_id"], name: "index_habit_goal_tasks_on_goal_id"
  add_index "habit_goal_tasks", ["habit_type_id"], name: "index_habit_goal_tasks_on_habit_type_id"
  add_index "habit_goal_tasks", ["user_id"], name: "index_habit_goal_tasks_on_user_id"

  create_table "habit_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "habits", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "habit_type_id"
    t.integer  "time_in_minutes"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
  end

  add_index "habits", ["category_id"], name: "index_habits_on_category_id"
  add_index "habits", ["habit_type_id"], name: "index_habits_on_habit_type_id"
  add_index "habits", ["user_id"], name: "index_habits_on_user_id"

  create_table "life_event_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "life_events", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "name"
    t.text     "description"
    t.integer  "life_event_type_id"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "life_events", ["category_id"], name: "index_life_events_on_category_id"
  add_index "life_events", ["life_event_type_id"], name: "index_life_events_on_life_event_type_id"
  add_index "life_events", ["user_id"], name: "index_life_events_on_user_id"

  create_table "transaction_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transaction_goal_tasks", force: :cascade do |t|
    t.integer  "transaction_category_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "goal_amount_in_dollars"
    t.integer  "goal_id"
    t.boolean  "transaction_required"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id"
    t.string   "name"
  end

  add_index "transaction_goal_tasks", ["goal_id"], name: "index_transaction_goal_tasks_on_goal_id"
  add_index "transaction_goal_tasks", ["transaction_category_id"], name: "index_transaction_goal_tasks_on_transaction_category_id"
  add_index "transaction_goal_tasks", ["user_id"], name: "index_transaction_goal_tasks_on_user_id"

  create_table "transaction_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "transaction_type_id"
    t.integer  "transaction_category_id"
    t.integer  "amount_in_dollars"
    t.boolean  "required"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.date     "transaction_date"
    t.integer  "user_id"
  end

  add_index "transactions", ["transaction_category_id"], name: "index_transactions_on_transaction_category_id"
  add_index "transactions", ["transaction_type_id"], name: "index_transactions_on_transaction_type_id"
  add_index "transactions", ["user_id"], name: "index_transactions_on_user_id"

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
