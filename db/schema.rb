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

ActiveRecord::Schema.define(:version => 20121011163745) do

  create_table "academics", :force => true do |t|
    t.string   "title"
    t.string   "first"
    t.string   "last"
    t.string   "work_phone"
    t.string   "work_mail"
    t.string   "home_url"
    t.string   "image_url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "students", :force => true do |t|
    t.string   "first"
    t.string   "last"
    t.string   "registration"
    t.string   "location"
    t.string   "photo_url"
    t.text     "interests"
    t.string   "programme"
    t.string   "email"
    t.string   "home_url"
    t.string   "work_phone"
    t.string   "title"
    t.string   "funder"
    t.string   "supervisor"
    t.string   "cosupervisor"
    t.string   "status"
    t.date     "started_on"
    t.date     "expected_on"
    t.date     "completed_on"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
