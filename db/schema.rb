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

ActiveRecord::Schema.define(version: 2018_07_23_132924) do

  create_table "articles", force: :cascade do |t|
    t.string "title", null: false
    t.text "body", null: false
    t.datetime "released_at", null: false
    t.datetime "expired_at"
    t.boolean "user_only", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "song_title", null: false
    t.string "song_url", null: false
    t.float "sizuka", default: 5.0, null: false
    t.float "yukkuri", default: 5.0, null: false
    t.float "zinkou", default: 5.0, null: false
    t.float "sukitoru", default: 5.0, null: false
    t.float "tantyo", default: 5.0, null: false
    t.float "akarui", default: 5.0, null: false
    t.float "atarashi", default: 5.0, null: false
    t.float "sodai", default: 5.0, null: false
    t.float "juko", default: 5.0, null: false
    t.float "daitan", default: 5.0, null: false
    t.float "otituita", default: 5.0, null: false
    t.float "dainamikku", default: 5.0, null: false
    t.integer "counts", default: 0, null: false
    t.float "tekigou", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.string "composer"
    t.string "Lyricist"
    t.string "singer"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name", null: false
    t.integer "admin", default: 0, null: false
    t.integer "gender", null: false
    t.string "mail", null: false
    t.date "birthday", null: false
    t.float "sizuka", default: 5.0, null: false
    t.float "yukkuri", default: 5.0, null: false
    t.float "zinkou", default: 5.0, null: false
    t.float "sukitoru", default: 5.0, null: false
    t.float "tantyo", default: 5.0, null: false
    t.float "akarui", default: 5.0, null: false
    t.float "atarashi", default: 5.0, null: false
    t.float "sodai", default: 5.0, null: false
    t.float "juko", default: 5.0, null: false
    t.float "daitan", default: 5.0, null: false
    t.float "otituita", default: 5.0, null: false
    t.float "dainamikku", default: 5.0, null: false
    t.integer "counts", default: 0, null: false
    t.float "tekigou", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "recent1", default: 1, null: false
    t.integer "recent2", default: 2, null: false
    t.integer "recent3", default: 3, null: false
    t.integer "recent4", default: 4, null: false
    t.integer "recent5", default: 5, null: false
    t.string "hashed_password"
  end

end
