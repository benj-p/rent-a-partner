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

ActiveRecord::Schema.define(version: 2019_02_28_123844) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "personality_id"
    t.bigint "user_id"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "message"
    t.index ["personality_id"], name: "index_bookings_on_personality_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.boolean "read", default: false
    t.bigint "sender_id"
    t.bigint "recipient_id"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_messages_on_booking_id"
  end

  create_table "personalities", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "bio"
    t.bigint "user_id"
    t.string "desired_gender"
    t.integer "desired_age"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_per_day"
    t.index ["user_id"], name: "index_personalities_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "personality_rating"
    t.text "personality_comment"
    t.bigint "user_id"
    t.bigint "personality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_rating"
    t.text "user_comment"
    t.bigint "booking_id"
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
    t.index ["personality_id"], name: "index_reviews_on_personality_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "location"
    t.integer "age"
    t.string "gender"
    t.string "picture"
    t.string "desired_gender"
    t.integer "desired_age"
    t.text "bio"
    t.boolean "is_partner", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "personalities"
  add_foreign_key "bookings", "users"
  add_foreign_key "messages", "bookings"
  add_foreign_key "messages", "users", column: "recipient_id"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "personalities", "users"
  add_foreign_key "reviews", "bookings"
  add_foreign_key "reviews", "personalities"
  add_foreign_key "reviews", "users"
end
