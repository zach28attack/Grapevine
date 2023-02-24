# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_23_201831) do
  create_table "diaries", force: :cascade do |t|
    t.integer "calories_budget"
    t.integer "calories_eaten"
    t.integer "calories_left"
    t.integer "protein_budget"
    t.integer "protein_eaten"
    t.integer "protein_left"
    t.integer "fats_budget"
    t.integer "fats_eaten"
    t.integer "fats_left"
    t.integer "carbs_budget"
    t.integer "carbs_eaten"
    t.integer "carbs_left"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time_of_day"
  end

  create_table "foods", force: :cascade do |t|
    t.string "food_name"
    t.integer "calories"
    t.integer "protein"
    t.integer "carbs"
    t.integer "fats"
    t.integer "servings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "calories_budget"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
