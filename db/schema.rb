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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20150416142720) do
=======
ActiveRecord::Schema.define(version: 20150416150454) do
85f8013d86cf16a3c1ea917375b348d220dac845

  create_table "activities", force: :cascade do |t|
    t.integer  "itinerary_id"
    t.integer  "attraction_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "attractions", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "date"
    t.text     "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "discussion_id"
    t.string   "discussion_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "comments", ["discussion_type", "discussion_id"], name: "index_comments_on_discussion_type_and_discussion_id"

  create_table "flights", force: :cascade do |t|
    t.string   "airline"
    t.datetime "date"
    t.string   "origin"
    t.string   "destination"
    t.text     "review"
    t.integer  "itinerary_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "date"
    t.text     "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itineraries", force: :cascade do |t|
    t.string   "title"
    t.string   "location"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.integer  "itinerary_id"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "photos", ["imageable_type", "imageable_id"], name: "index_photos_on_imageable_type_and_imageable_id"

  create_table "reservations", force: :cascade do |t|
    t.integer  "itinerary_id"
    t.integer  "hotel_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.text     "review"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "temps", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "uid"
    t.string   "provider"
  end

end
