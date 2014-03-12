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

ActiveRecord::Schema.define(version: 20140312143554) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.string   "role",             default: "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
  add_index "comments", ["commentable_type"], name: "index_comments_on_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

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
    t.integer  "User_id"
    t.integer  "Course_id"
    t.integer  "University_id"
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

  add_index "educations", ["Course_id"], name: "index_educations_on_Course_id", using: :btree
  add_index "educations", ["University_id"], name: "index_educations_on_University_id", using: :btree
  add_index "educations", ["User_id"], name: "index_educations_on_User_id", using: :btree

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "postText"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["user_id", "created_at"], name: "index_posts_on_user_id_and_created_at", using: :btree

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
    t.integer  "userType"
    t.date     "dob"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
