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

ActiveRecord::Schema.define(version: 2021_02_03_174054) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "earnings", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.datetime "date", default: "2021-02-03 00:00:00", null: false
    t.float "value", default: 0.0, null: false
    t.string "description", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "movement_type_id"
    t.bigint "user_id"
    t.bigint "sub_type_id"
    t.index ["movement_type_id"], name: "index_earnings_on_movement_type_id"
    t.index ["sub_type_id"], name: "index_earnings_on_sub_type_id"
    t.index ["user_id"], name: "index_earnings_on_user_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.datetime "date", default: "2021-02-03 00:00:00", null: false
    t.float "value", default: 0.0, null: false
    t.string "description", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "movement_type_id"
    t.bigint "user_id"
    t.bigint "sub_type_id"
    t.index ["movement_type_id"], name: "index_expenses_on_movement_type_id"
    t.index ["sub_type_id"], name: "index_expenses_on_sub_type_id"
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "movement_types", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.string "color", default: "#000000", null: false
    t.string "pointer_type", default: "ganho", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_movement_types_on_user_id"
  end

  create_table "sub_types", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.string "color", default: "#000000", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "movement_type_id"
    t.index ["movement_type_id"], name: "index_sub_types_on_movement_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "individual", default: true, null: false
    t.string "name", default: "", null: false
    t.string "cpf", default: "", null: false
    t.string "email", default: "", null: false
    t.string "phone", default: "", null: false
    t.string "password_digest", default: "", null: false
    t.string "birthdate", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "earnings", "movement_types"
  add_foreign_key "earnings", "sub_types"
  add_foreign_key "earnings", "users"
  add_foreign_key "expenses", "movement_types"
  add_foreign_key "expenses", "sub_types"
  add_foreign_key "expenses", "users"
  add_foreign_key "movement_types", "users"
  add_foreign_key "sub_types", "movement_types"
end
