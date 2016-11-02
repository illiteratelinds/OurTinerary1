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

ActiveRecord::Schema.define(version: 20150428013414) do

  create_table "activities", force: :cascade do |t|
    t.integer  "itinerary_id"
    t.integer  "attraction_id"
    t.datetime "date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "attractions", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.text     "content"
    t.integer  "user_id"
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.string "status"
  end

  create_table "hotels", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "itineraries", force: :cascade do |t|
    t.string   "title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itinerary_items", force: :cascade do |t|
    t.integer  "itinerary_id"
    t.integer  "itemable_id"
    t.string   "itemable_type"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "position",      default: 0
  end

  add_index "itinerary_items", ["itemable_type", "itemable_id"], name: "index_itinerary_items_on_itemable_type_and_itemable_id"

  create_table "meals", force: :cascade do |t|
    t.integer  "itinerary_id"
    t.integer  "restaurant_id"
    t.datetime "date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "photos", ["imageable_type", "imageable_id"], name: "index_photos_on_imageable_type_and_imageable_id"

  create_table "reservations", force: :cascade do |t|
    t.integer  "itinerary_id"
    t.integer  "hotel_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "reviewable_id"
    t.string   "reviewable_type"
    t.integer  "rating"
    t.text     "content"
    t.integer  "creator_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "reviews", ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable_type_and_reviewable_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "uid"
    t.string   "provider"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "image"
  end

  create_table "wishlists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "wishlistable_id"
    t.string   "wishlistable_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "wishlists", ["wishlistable_type", "wishlistable_id"], name: "index_wishlists_on_wishlistable_type_and_wishlistable_id"

end
