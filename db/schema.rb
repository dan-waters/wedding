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

ActiveRecord::Schema.define(version: 20150517122641) do

  create_table "destinations", force: :cascade do |t|
    t.string   "name"
    t.date     "arrival_date"
    t.date     "departure_date"
    t.integer  "honeymoon_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "guest_types", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "guests", force: :cascade do |t|
    t.string   "name"
    t.boolean  "invited"
    t.boolean  "accepted"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "guest_type_id"
  end

  create_table "honeymoons", force: :cascade do |t|
    t.date     "from"
    t.date     "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.boolean  "booked"
    t.integer  "destination_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "hotels", ["destination_id"], name: "index_hotels_on_destination_id"

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "booked",     default: false, null: false
    t.text     "notes"
    t.string   "slug"
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "person_id"
    t.decimal  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "payments", ["item_id"], name: "index_payments_on_item_id"
  add_index "payments", ["person_id"], name: "index_payments_on_person_id"

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
