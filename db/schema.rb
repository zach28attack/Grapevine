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

ActiveRecord::Schema[7.0].define(version: 2023_02_27_201055) do
  create_table "diaries", force: :cascade do |t|
    t.integer "calories_eaten"
    t.integer "protein_eaten"
    t.integer "fats_eaten"
    t.integer "carbs_eaten"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time_of_day"
    t.integer "food_id"
    t.integer "meal_id"
    t.index ["meal_id"], name: "index_diaries_on_meal_id"
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

  create_table "foods_meals", force: :cascade do |t|
    t.integer "food_id", null: false
    t.integer "meal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_foods_meals_on_food_id"
    t.index ["meal_id"], name: "index_foods_meals_on_meal_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "meal_name"
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
    t.integer "cals_budget"
    t.integer "protein_budget"
    t.integer "fats_budget"
    t.integer "carbs_budget"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "diaries", "meals"
  add_foreign_key "foods_meals", "foods"
  add_foreign_key "foods_meals", "meals"
end
