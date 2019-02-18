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

ActiveRecord::Schema.define(version: 20190218155128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "debts", force: :cascade do |t|
    t.float    "amount"
    t.integer  "from_id"
    t.integer  "to_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "accepted",       default: false
    t.string   "casheable_type"
    t.integer  "casheable_id"
    t.index ["casheable_type", "casheable_id"], name: "index_debts_on_casheable_type_and_casheable_id", using: :btree
  end

  create_table "lists", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.text     "description"
    t.boolean  "is_poll?"
    t.boolean  "is_public?"
    t.boolean  "allow_anonymous?"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "private",          default: false
    t.string   "allowed_voters"
    t.boolean  "has_pricetag",     default: false
    t.index ["user_id"], name: "index_lists_on_user_id", using: :btree
  end

  create_table "notes", force: :cascade do |t|
    t.string   "name"
    t.text     "contents"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "parent_type"
    t.integer  "parent_id"
    t.integer  "user_id"
    t.boolean  "has_pricetag", default: false
    t.index ["parent_type", "parent_id"], name: "index_notes_on_parent_type_and_parent_id", using: :btree
    t.index ["user_id"], name: "index_notes_on_user_id", using: :btree
  end

  create_table "options", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "list_id"
    t.integer  "votes"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "voters"
    t.boolean  "has_pricetag", default: false
    t.index ["list_id"], name: "index_options_on_list_id", using: :btree
    t.index ["user_id"], name: "index_options_on_user_id", using: :btree
  end

  create_table "planner_events", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.text     "description"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "url"
    t.boolean  "has_pricetag", default: false
  end

  create_table "pricetags", force: :cascade do |t|
    t.float    "price"
    t.integer  "user_id"
    t.integer  "operation"
    t.integer  "state",        default: 0
    t.integer  "type",         default: 0
    t.string   "listing_type"
    t.integer  "listing_id"
    t.text     "description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["listing_type", "listing_id"], name: "index_pricetags_on_listing_type_and_listing_id", using: :btree
    t.index ["user_id"], name: "index_pricetags_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.text     "bio"
    t.string   "phone_number"
    t.string   "room"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.string   "positive_votes"
    t.string   "negative_votes"
    t.string   "voteable_type"
    t.integer  "voteable_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["voteable_type", "voteable_id"], name: "index_votes_on_voteable_type_and_voteable_id", using: :btree
  end

  add_foreign_key "debts", "users", column: "from_id"
  add_foreign_key "debts", "users", column: "to_id"
  add_foreign_key "lists", "users"
  add_foreign_key "notes", "users"
  add_foreign_key "options", "lists"
  add_foreign_key "options", "users"
  add_foreign_key "pricetags", "users"
end
