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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101012032423) do

  create_table "countries", :force => true do |t|
    t.string   "iso"
    t.string   "name"
    t.string   "printable_name"
    t.string   "iso3"
    t.integer  "numcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "story_id"
  end

  add_index "microposts", ["story_id"], :name => "index_microposts_on_story_id"
  add_index "microposts", ["user_id"], :name => "index_microposts_on_user_id"

  create_table "stories", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.string   "time"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mood"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin",              :default => false
    t.string   "country"
    t.integer  "age"
    t.string   "gender"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
