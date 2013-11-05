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

ActiveRecord::Schema.define(version: 20131105122155) do

  create_table "activities", force: true do |t|
    t.datetime "dead_line"
    t.integer  "step_price"
    t.integer  "ok_price"
    t.string   "status"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activity_books", force: true do |t|
    t.integer  "activity_id"
    t.integer  "book_id"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ask_fors", force: true do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_categories", force: true do |t|
    t.string   "lvl1"
    t.string   "lvl2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_categories_books", id: false, force: true do |t|
    t.integer "book_category_id"
    t.integer "book_id"
  end

  create_table "book_infos", force: true do |t|
    t.string   "ISBN"
    t.string   "title"
    t.string   "author"
    t.string   "publisher"
    t.date     "publish_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "ISBN"
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "books", ["ISBN"], name: "index_books_on_ISBN"

  create_table "user_activities", force: true do |t|
    t.integer  "user_id"
    t.integer  "activity_id"
    t.integer  "price"
    t.boolean  "is_seller"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_books", force: true do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.integer  "acount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_infos", force: true do |t|
    t.string   "name"
    t.boolean  "gender"
    t.string   "location"
    t.text     "self_description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "birthday"
  end

  add_index "user_infos", ["user_id"], name: "index_user_infos_on_user_id"

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
