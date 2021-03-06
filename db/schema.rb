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

ActiveRecord::Schema.define(version: 20140412202441) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.integer  "user_id"
    t.text     "title"
    t.text     "articleText"
    t.integer  "Status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

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
    t.integer  "user_id"
    t.integer  "course_id"
    t.integer  "university_id"
    t.date     "startDate"
    t.date     "endDate"
    t.text     "accessibilityReview"
    t.text     "supportRequested"
    t.boolean  "supportReceived"
    t.text     "reason"
    t.integer  "disabilityDeptRating"
    t.integer  "courseDeptRating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "educations", ["course_id"], name: "index_educations_on_course_id", using: :btree
  add_index "educations", ["university_id"], name: "index_educations_on_university_id", using: :btree
  add_index "educations", ["user_id"], name: "index_educations_on_user_id", using: :btree

  create_table "friendships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["followed_id"], name: "index_friendships_on_followed_id", using: :btree
  add_index "friendships", ["follower_id", "followed_id"], name: "index_friendships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "friendships", ["follower_id"], name: "index_friendships_on_follower_id", using: :btree

  create_table "impairments", force: true do |t|
    t.integer  "disability_id"
    t.integer  "user_id"
    t.integer  "severity"
    t.text     "other"
    t.text     "supportRequired"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impairments", ["disability_id"], name: "index_impairments_on_disability_id", using: :btree
  add_index "impairments", ["user_id"], name: "index_impairments_on_user_id", using: :btree

  create_table "post_comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_comments", ["post_id"], name: "index_post_comments_on_post_id", using: :btree
  add_index "post_comments", ["user_id"], name: "index_post_comments_on_user_id", using: :btree

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
    t.decimal  "disabilityDeptRating", precision: 3, scale: 2
    t.decimal  "courseDeptRating",     precision: 3, scale: 2
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
