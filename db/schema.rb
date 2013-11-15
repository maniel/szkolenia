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

ActiveRecord::Schema.define(version: 20131114113857) do

  create_table "categories", force: true do |t|
    t.boolean  "studies"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizers", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.text     "contact"
    t.string   "link"
    t.boolean  "college"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "school_type"
  end

  create_table "trainers", force: true do |t|
    t.string   "name"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "trainers_trainings", force: true do |t|
    t.integer "trainer_id"
    t.integer "training_id"
  end

  create_table "trainings", force: true do |t|
    t.string   "name"
    t.text     "info"
    t.text     "moreinfo"
    t.text     "target"
    t.text     "methods"
    t.text     "groupsize"
    t.boolean  "studies"
    t.boolean  "postgrad"
    t.boolean  "elearning"
    t.boolean  "paid"
    t.string   "costs"
    t.text     "costs_info"
    t.text     "trainer_info"
    t.string   "term"
    t.text     "term_info"
    t.date     "begin_date"
    t.date     "end_date"
    t.text     "address"
    t.integer  "organizer_id"
    t.integer  "location_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "term_notes"
    t.text     "term_contact"
  end

  add_index "trainings", ["category_id"], name: "index_trainings_on_category_id"
  add_index "trainings", ["location_id"], name: "index_trainings_on_location_id"
  add_index "trainings", ["organizer_id"], name: "index_trainings_on_organizer_id"

  create_table "users", force: true do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "zawod", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "additional_info"
    t.text     "address"
    t.text     "costs_semester"
    t.text     "costs_info"
    t.date     "begin_date"
    t.date     "end_date"
    t.text     "term_time"
    t.text     "term_info"
    t.text     "documents"
    t.integer  "organizer_id"
    t.integer  "location_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "paid"
    t.text     "requirements"
    t.text     "term_additional_info"
    t.text     "program"
    t.text     "begin_date_text"
    t.text     "end_date_text"
  end

  add_index "zawod", ["category_id"], name: "index_zawod_on_category_id"
  add_index "zawod", ["location_id"], name: "index_zawod_on_location_id"
  add_index "zawod", ["organizer_id"], name: "index_zawod_on_organizer_id"

end
