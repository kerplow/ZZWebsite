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

ActiveRecord::Schema.define(version: 20200329213013) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # These are custom enum types that must be created before they can be used in the schema definition
  create_enum "house_statuses", ["housemate", "subrenter", "old_housemate", "house_pet"]

  create_table "cleaning_tasks", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "cleaning_weeks", force: :cascade do |t|
    t.integer   "week_number"
    t.daterange "week_dates"
    t.index ["week_dates"], name: "index_cleaning_weeks_on_week_dates", using: :btree
    t.index ["week_number"], name: "index_cleaning_weeks_on_week_number", using: :btree
  end

  create_table "debts", force: :cascade do |t|
    t.float    "amount"
    t.integer  "from_id"
    t.integer  "to_id"
    t.text     "description"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "accepted",       default: false
    t.string   "casheable_type"
    t.integer  "casheable_id"
    t.boolean  "collected"
    t.index ["casheable_type", "casheable_id"], name: "index_debts_on_casheable_type_and_casheable_id", using: :btree
  end

  create_table "lists", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.text     "description"
    t.boolean  "poll"
    t.boolean  "is_public",       default: true
    t.boolean  "allow_anonymous"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "private",         default: false
    t.string   "allowed_voters"
    t.boolean  "has_pricetag",    default: false
    t.index ["user_id"], name: "index_lists_on_user_id", using: :btree
  end

  create_table "notes", force: :cascade do |t|
    t.string   "name"
    t.text     "contents"
    t.boolean  "is_public",    default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "parent_type"
    t.integer  "parent_id"
    t.integer  "user_id"
    t.boolean  "has_pricetag", default: false
    t.string   "subject"
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
    t.string   "down_voters"
    t.index ["list_id"], name: "index_options_on_list_id", using: :btree
    t.index ["user_id"], name: "index_options_on_user_id", using: :btree
  end

  create_table "planner_events", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.text     "description"
    t.boolean  "is_public",    default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "url"
    t.boolean  "has_pricetag", default: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_planner_events_on_user_id", using: :btree
  end

  create_table "polls", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "list_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["list_id"], name: "index_polls_on_list_id", using: :btree
  end

  create_table "pricetags", force: :cascade do |t|
    t.float    "price"
    t.integer  "user_id"
    t.integer  "operation"
    t.integer  "state",            default: 0
    t.integer  "transaction_type", default: 0
    t.string   "listing_type"
    t.integer  "listing_id"
    t.text     "description"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["listing_type", "listing_id"], name: "index_pricetags_on_listing_type_and_listing_id", using: :btree
    t.index ["user_id"], name: "index_pricetags_on_user_id", using: :btree
  end

  create_table "room_tasks", force: :cascade do |t|
    t.integer  "room_id"
    t.boolean  "done",             default: false
    t.integer  "cleaning_task_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "cleaning_week_id"
    t.index ["cleaning_task_id"], name: "index_room_tasks_on_cleaning_task_id", using: :btree
    t.index ["cleaning_week_id"], name: "index_room_tasks_on_cleaning_week_id", using: :btree
    t.index ["room_id"], name: "index_room_tasks_on_room_id", using: :btree
  end

  create_table "rooms", force: :cascade do |t|
    t.integer  "number"
    t.text     "description"
    t.string   "location"
    t.string   "door"
    t.integer  "owner_id"
    t.integer  "current_tenant_id"
    t.integer  "past_tenants",                   array: true
    t.string   "tenant_name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["current_tenant_id"], name: "index_rooms_on_current_tenant_id", using: :btree
    t.index ["owner_id"], name: "index_rooms_on_owner_id", using: :btree
  end

  create_table "shopping_items", force: :cascade do |t|
    t.string   "item"
    t.float    "price"
    t.integer  "user_id"
    t.integer  "shopping_list_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "amount",           default: 1
    t.index ["shopping_list_id"], name: "index_shopping_items_on_shopping_list_id", using: :btree
    t.index ["user_id"], name: "index_shopping_items_on_user_id", using: :btree
  end

  create_table "shopping_lists", force: :cascade do |t|
    t.string   "name"
    t.datetime "planned_time"
    t.string   "description"
    t.integer  "user_id"
    t.integer  "status",       default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id"], name: "index_shopping_lists_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",          null: false
    t.string   "encrypted_password",     default: "",          null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.text     "bio"
    t.string   "phone_number"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.boolean  "admin",                  default: false
    t.enum     "house_status",           default: "house_pet",              as: "house_statuses"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "voteables", force: :cascade do |t|
    t.integer "poll_id"
    t.string  "choice_type"
    t.integer "choice_id"
    t.index ["choice_type", "choice_id"], name: "index_voteables_on_choice_type_and_choice_id", using: :btree
    t.index ["poll_id"], name: "index_voteables_on_poll_id", using: :btree
  end

  add_foreign_key "debts", "users", column: "from_id"
  add_foreign_key "debts", "users", column: "to_id"
  add_foreign_key "lists", "users"
  add_foreign_key "notes", "users"
  add_foreign_key "options", "lists"
  add_foreign_key "options", "users"
  add_foreign_key "planner_events", "users"
  add_foreign_key "pricetags", "users"
  add_foreign_key "room_tasks", "cleaning_tasks"
  add_foreign_key "room_tasks", "cleaning_weeks"
  add_foreign_key "room_tasks", "rooms"
  add_foreign_key "rooms", "users", column: "current_tenant_id"
  add_foreign_key "rooms", "users", column: "owner_id"
  add_foreign_key "shopping_items", "shopping_lists"
  add_foreign_key "shopping_items", "users"
end
