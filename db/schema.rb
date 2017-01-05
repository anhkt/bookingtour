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

ActiveRecord::Schema.define(version: 20170105193001) do

  create_table "bank_cards", force: :cascade do |t|
    t.integer  "card_type"
    t.string   "owner_name"
    t.string   "card_num"
    t.integer  "bank_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_id"], name: "index_bank_cards_on_bank_id"
    t.index ["user_id"], name: "index_bank_cards_on_user_id"
  end

  create_table "banks", force: :cascade do |t|
    t.string   "name"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "num_tourist"
    t.string   "contact_name"
    t.string   "contact_phone"
    t.string   "contact_address"
    t.text     "description"
    t.float    "total_price"
    t.integer  "status",          default: 0
    t.boolean  "is_cancel",       default: false
    t.integer  "tour_date_id"
    t.integer  "user_id"
    t.datetime "deleted_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["tour_date_id"], name: "index_bookings_on_tour_date_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "parent_id"
    t.integer  "review_id"
    t.integer  "user_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_comments_on_review_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "likeable_id"
    t.datetime "deleted_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["likeable_id", nil], name: "index_likes_on_likeable_id_and_likeable_type"
    t.index ["likeable_id"], name: "index_likes_on_likeable_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string   "customer_token"
    t.string   "charge_token"
    t.string   "card_token"
    t.string   "email"
    t.integer  "booking_id"
    t.datetime "deleted_at"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["booking_id"], name: "index_payments_on_booking_id"
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "picture"
    t.integer  "place_type"
    t.integer  "parent_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_places_on_deleted_at"
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "rate"
    t.integer  "user_id"
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["rateable_type", "rateable_id"], name: "index_rates_on_rateable_type_and_rateable_id"
    t.index ["user_id"], name: "index_rates_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "review_type"
    t.string   "title"
    t.text     "content"
    t.float    "rate",        default: 0.0
    t.integer  "user_id"
    t.integer  "tour_id"
    t.datetime "deleted_at"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["tour_id"], name: "index_reviews_on_tour_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "tour_places", force: :cascade do |t|
    t.integer  "tour_id"
    t.integer  "place_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_tour_places_on_place_id"
    t.index ["tour_id"], name: "index_tour_places_on_tour_id"
  end

  create_table "tours", force: :cascade do |t|
    t.string   "name"
    t.float    "price_per_person"
    t.text     "description"
    t.integer  "num_people"
    t.integer  "duration"
    t.string   "picture"
    t.boolean  "status",           default: true
    t.float    "rate",             default: 0.0
    t.float    "discount",         default: 0.0
    t.integer  "category_id"
    t.datetime "deleted_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["category_id"], name: "index_tours_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.string   "email"
    t.string   "avatar"
    t.boolean  "is_admin"
    t.string   "digest_password"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index [nil], name: "index_users_on_deleted_at"
  end

end
