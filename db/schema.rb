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

ActiveRecord::Schema.define(version: 20170215053153) do

  create_table "static_pages", force: :cascade do |t|
    t.string   "home"
    t.string   "help"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "user_id",                          null:false
    t.integer "age"
    t.text "location"
    t.text "name",                                null:false
    t.text "phone_number"
    t.integer "rating"
    t.text "user_bio"
    t.text "instrument"
    t.text "level"
  end

  create_table "jam_sessions", force: :cascade do |t|
    t.integer "jam_sessions_id",                  null: false
    t.integer "init_user_id",                     null: false
    t.integer "part_user_id",                     null: false
    t.datetime "sesh_time",                       null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    #t.datetime "created_at",                      null: false
    #t.datetime "updated_at",                      null: false
  end

  create_table "friends", force: :cascade do |t|
    t.integer  "friendable_id",                   null: false
    t.integer  "friender_id",                     null: false
    t.boolean  "blocked",         default: false, null: false
  end

  add_index "friends", ["friendable_id","friender_id"], name: "friender friends friendable", using: :btree

end
