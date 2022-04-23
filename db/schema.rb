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

ActiveRecord::Schema.define(version: 2022_04_22_192340) do

  create_table "budgets", force: :cascade do |t|
    t.decimal "amount"
    t.string "month"
    t.integer "user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "description"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "description"
    t.decimal "amount"
    t.date "date_created"
    t.integer "category_id"
    t.integer "budget_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
  end

end
