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

ActiveRecord::Schema.define(version: 20140213001838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "qualification"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "disabilities", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "educations", force: true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.integer  "university_id"
    t.date     "startDate"
    t.date     "endDate"
    t.text     "accessibilityReview"
    t.text     "supportRequested"
    t.boolean  "supportReceived"
    t.text     "reason"
    t.decimal  "disabilityDeptRating", precision: 2, scale: 2
    t.decimal  "courseDeptRating",     precision: 2, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "universities", force: true do |t|
    t.string   "name"
    t.text     "url"
    t.text     "disabilityURL"
    t.decimal  "disabilityDeptRating", precision: 2, scale: 2
    t.decimal  "courseDeptRating",     precision: 2, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_disabilities", force: true do |t|
    t.integer  "disability_id"
    t.integer  "user_id"
    t.string   "severity"
    t.text     "supportRequired"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "email"
    t.string   "password"
    t.integer  "userType"
    t.date     "dob"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
