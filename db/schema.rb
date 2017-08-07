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

ActiveRecord::Schema.define(version: 20170807092338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "avg",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "photo_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "travel_id"
  end

  add_index "comments", ["photo_id"], name: "index_comments_on_photo_id", using: :btree
  add_index "comments", ["travel_id"], name: "index_comments_on_travel_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "friendships", force: :cascade do |t|
    t.integer  "friend1_id"
    t.integer  "friend2_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "confirmed"
  end

  add_index "friendships", ["friend1_id", "friend2_id"], name: "index_friendships_on_friend1_id_and_friend2_id", unique: true, using: :btree
  add_index "friendships", ["friend1_id"], name: "index_friendships_on_friend1_id", using: :btree
  add_index "friendships", ["friend2_id"], name: "index_friendships_on_friend2_id", using: :btree

  create_table "hearts", force: :cascade do |t|
    t.integer  "photo_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "hearts", ["photo_id"], name: "index_hearts_on_photo_id", using: :btree
  add_index "hearts", ["user_id"], name: "index_hearts_on_user_id", using: :btree

  create_table "hotspots", force: :cascade do |t|
    t.string   "name"
    t.integer  "stars"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
  end

  create_table "infos", force: :cascade do |t|
    t.text     "interests"
    t.string   "city"
    t.string   "fb"
    t.string   "dob"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "infos", ["user_id"], name: "index_infos_on_user_id", using: :btree

  create_table "overall_averages", force: :cascade do |t|
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "overall_avg",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "caption"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
    t.integer  "likes"
    t.integer  "hotspot_id"
  end

  add_index "photos", ["hotspot_id"], name: "index_photos_on_hotspot_id", using: :btree
  add_index "photos", ["user_id"], name: "index_photos_on_user_id", using: :btree

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id", using: :btree

  create_table "rating_caches", force: :cascade do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree

  create_table "travels", force: :cascade do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.string   "featured_image_file_name"
    t.string   "featured_image_content_type"
    t.integer  "featured_image_file_size"
    t.datetime "featured_image_updated_at"
    t.integer  "hotspot_id"
  end

  add_index "travels", ["hotspot_id"], name: "index_travels_on_hotspot_id", using: :btree
  add_index "travels", ["user_id"], name: "index_travels_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comments", "photos"
  add_foreign_key "comments", "travels"
  add_foreign_key "comments", "users"
  add_foreign_key "infos", "users"
  add_foreign_key "photos", "hotspots"
  add_foreign_key "photos", "users"
  add_foreign_key "travels", "hotspots"
  add_foreign_key "travels", "users"
end
