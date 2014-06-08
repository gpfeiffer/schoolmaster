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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140608175119) do

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
    t.integer  "user_id"
    t.integer  "school_id"
    t.string   "short"
  end

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "atoms", :force => true do |t|
    t.string   "code"
    t.string   "title"
    t.text     "description"
    t.integer  "hours"
    t.string   "weeks"
    t.integer  "semester"
    t.string   "discipline"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "authors", :force => true do |t|
    t.string   "first"
    t.string   "last"
    t.string   "registration"
    t.string   "programme"
    t.string   "email"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "photo_url"
  end

  create_table "bookings", :force => true do |t|
    t.integer  "project_id"
    t.integer  "slot_id"
    t.integer  "venue_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "brokers", :force => true do |t|
    t.string   "name"
    t.string   "template"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "committees", :force => true do |t|
    t.integer  "academic_id"
    t.integer  "student_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "chair",       :default => false, :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "code"
    t.integer  "credits"
    t.string   "taught"
    t.string   "examined"
    t.integer  "lecture_hours"
    t.integer  "tutorial_hours"
    t.integer  "lab_hours"
    t.integer  "self_study_hours"
    t.integer  "placement_hours"
    t.text     "content"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.text     "outcomes"
    t.text     "resources"
    t.string   "discipline"
  end

  create_table "directions", :force => true do |t|
    t.integer  "project_id"
    t.integer  "academic_id"
    t.text     "comment"
    t.integer  "midterm_mark"
    t.integer  "presentation_mark"
    t.integer  "report_mark"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.boolean  "open"
  end

  create_table "enrolments", :force => true do |t|
    t.string   "first"
    t.string   "last"
    t.string   "number"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "examinations", :force => true do |t|
    t.integer  "project_id"
    t.integer  "academic_id"
    t.text     "comment"
    t.integer  "presentation_mark"
    t.integer  "report_mark"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.boolean  "open"
  end

  create_table "loads", :force => true do |t|
    t.integer  "academic_id"
    t.integer  "atom_id"
    t.integer  "year"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "times"
  end

  create_table "projects", :force => true do |t|
    t.integer  "author_id"
    t.string   "title"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "penalty",    :default => 0, :null => false
    t.integer  "year"
  end

  create_table "proposals", :force => true do |t|
    t.string   "title"
    t.integer  "enrolment_id"
    t.integer  "academic_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.boolean  "accepted"
  end

  create_table "records", :force => true do |t|
    t.integer  "academic_id"
    t.integer  "broker_id"
    t.string   "authorid"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rooms", :force => true do |t|
    t.string   "location"
    t.integer  "capacity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "number"
  end

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "slots", :force => true do |t|
    t.string   "time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "students", :force => true do |t|
    t.string   "first"
    t.string   "last"
    t.string   "registration"
    t.string   "photo_url"
    t.text     "interests"
    t.string   "programme"
    t.string   "email"
    t.string   "home_url"
    t.string   "work_phone"
    t.string   "title"
    t.string   "funder"
    t.string   "status"
    t.date     "started_on"
    t.date     "expected_on"
    t.date     "completed_on"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "room_id"
    t.date     "viva_date"
    t.string   "code"
    t.string   "area"
  end

  create_table "supervisions", :force => true do |t|
    t.integer  "academic_id"
    t.integer  "student_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "main",        :default => true, :null => false
  end

  create_table "teachings", :force => true do |t|
    t.integer  "year"
    t.integer  "semester"
    t.integer  "course_id"
    t.integer  "academic_id"
    t.decimal  "hours"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "venues", :force => true do |t|
    t.string   "location"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
