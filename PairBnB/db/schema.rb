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

ActiveRecord::Schema.define(version: 20170224070452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string   "uid"
    t.string   "token"
    t.string   "provider"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id", using: :btree
  end

  create_table "listings", force: :cascade do |t|
    t.string   "property_type"
    t.string   "size"
    t.string   "own_home"
    t.string   "guest_quantity"
    t.string   "bedroom_quantity"
    t.string   "bed_quantity"
    t.string   "bathroom_quantity"
    t.string   "country"
    t.string   "street_name"
    t.string   "property_name"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "amenities"
    t.string   "spaces_can_use"
    t.integer  "price_night"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "avatar"
    t.index ["user_id"], name: "index_listings_on_user_id", using: :btree
  end

  create_table "reservations", force: :cascade do |t|
    t.string   "guest_quantity"
    t.integer  "price_night"
    t.integer  "service_fee"
    t.integer  "travel_credit"
    t.integer  "total"
    t.string   "check_in"
    t.string   "check_out"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "birth_date"
    t.string   "email",                          null: false
    t.string   "phone_number"
    t.string   "encrypted_password", limit: 128
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.string   "avatar"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
  end

  add_foreign_key "authentications", "users"
end
