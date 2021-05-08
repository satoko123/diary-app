# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_08_140757) do

  create_table "diaries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "text"
    t.float "weight"
    t.date "created_on", null: false
    t.bigint "user_id", null: false
    t.bigint "feed_management_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_on"], name: "index_diaries_on_created_on", unique: true
    t.index ["feed_management_id"], name: "index_diaries_on_feed_management_id"
    t.index ["user_id"], name: "index_diaries_on_user_id"
  end

  create_table "feed_managements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "yesterday_leftover", default: 0, null: false
    t.integer "morning_addition", default: 0, null: false
    t.integer "noon_addition", default: 0, null: false
    t.integer "evening_addition", default: 0, null: false
    t.integer "today_leftover", default: 0, null: false
    t.integer "amount_eaten", null: false
    t.date "created_on", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_on"], name: "index_feed_managements_on_created_on", unique: true
    t.index ["user_id"], name: "index_feed_managements_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "diaries", "feed_managements"
  add_foreign_key "diaries", "users"
  add_foreign_key "feed_managements", "users"
end
