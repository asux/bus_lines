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

ActiveRecord::Schema.define(version: 2021_12_14_035934) do

  create_table "lines", force: :cascade do |t|
    t.integer "departure_location_id"
    t.integer "arrival_location_id"
    t.integer "capacity"
    t.datetime "departure_at"
    t.integer "duration"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "UAH", null: false
    t.integer "tickets_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["arrival_location_id"], name: "index_lines_on_arrival_location_id"
    t.index ["departure_location_id", "arrival_location_id", "departure_at"], name: "index_lines_on_departure_and_arrival_and_departure_at", unique: true
    t.index ["departure_location_id"], name: "index_lines_on_departure_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_locations_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.integer "role", default: 0
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["role"], name: "index_users_on_role"
  end

  add_foreign_key "lines", "locations", column: "arrival_location_id"
  add_foreign_key "lines", "locations", column: "departure_location_id"
end
