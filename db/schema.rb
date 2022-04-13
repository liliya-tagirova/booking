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

ActiveRecord::Schema.define(version: 2022_04_13_114704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hotels", force: :cascade do |t|
    t.string "title"
    t.integer "stars"
    t.string "address"
    t.float "rating"
    t.text "about_hotel"
    t.text "services"
    t.text "extra"
    t.text "contacts"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "hotel_id", null: false
    t.string "room_type"
    t.string "link_img"
    t.integer "price_per_night"
    t.string "bed_type"
    t.integer "number_of_people"
    t.string "comforts"
    t.string "booking_type"
    t.string "food"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hotel_id"], name: "index_rooms_on_hotel_id"
  end

  add_foreign_key "rooms", "hotels"
end
