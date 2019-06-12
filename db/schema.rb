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

ActiveRecord::Schema.define(version: 20190501184210) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ability_scores", force: :cascade do |t|
    t.string   "name"
    t.string   "full_name"
    t.text     "desc"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "user_id"
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
    t.index ["user_id"], name: "index_admin_users_on_user_id", using: :btree
  end

  create_table "armor_details", id: false, force: :cascade do |t|
    t.integer  "id",                   default: -> { "nextval('equipment_id_seq'::regclass)" }, null: false
    t.string   "name"
    t.string   "equipment_category"
    t.string   "url"
    t.text     "desc"
    t.integer  "price"
    t.integer  "weight"
    t.datetime "created_at",                                                                    null: false
    t.datetime "updated_at",                                                                    null: false
    t.boolean  "stealth_disadvantage", default: false
    t.string   "category_name",        default: "Armor"
    t.string   "armor_category"
    t.integer  "str_minimum"
    t.integer  "base_armor_class"
    t.boolean  "dex_bonus"
    t.integer  "max_bonus"
  end

  create_table "base_class_proficiencies", force: :cascade do |t|
    t.integer "character_class_id"
    t.integer "proficiencies_id"
    t.index ["character_class_id"], name: "index_base_class_proficiencies_on_character_class_id", using: :btree
    t.index ["proficiencies_id"], name: "index_base_class_proficiencies_on_proficiencies_id", using: :btree
  end

  create_table "base_starting_equipment", force: :cascade do |t|
    t.integer "amount"
    t.integer "character_class_id"
    t.integer "equipment_id"
    t.index ["character_class_id"], name: "index_base_starting_equipment_on_character_class_id", using: :btree
    t.index ["equipment_id"], name: "index_base_starting_equipment_on_equipment_id", using: :btree
  end

  create_table "character_classes", force: :cascade do |t|
    t.string   "name"
    t.integer  "hit_die"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "class_prof_choices", force: :cascade do |t|
    t.integer "amount"
    t.integer "character_class_id"
    t.index ["character_class_id"], name: "index_class_prof_choices_on_character_class_id", using: :btree
  end

  create_table "class_prof_options", force: :cascade do |t|
    t.integer "class_prof_choice_id"
    t.integer "proficiency_id"
    t.index ["class_prof_choice_id"], name: "index_class_prof_options_on_class_prof_choice_id", using: :btree
    t.index ["proficiency_id"], name: "index_class_prof_options_on_proficiency_id", using: :btree
  end

  create_table "contents", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "pack_id"
    t.integer  "equipment_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["equipment_id"], name: "index_contents_on_equipment_id", using: :btree
    t.index ["pack_id"], name: "index_contents_on_pack_id", using: :btree
  end

  create_table "currencies", force: :cascade do |t|
    t.string   "name"
    t.string   "coinage"
    t.integer  "absolute_value"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "damage_types", force: :cascade do |t|
    t.string   "name"
    t.text     "desc"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "damages", force: :cascade do |t|
    t.integer  "fixed_amount",   default: 0
    t.integer  "dice_value"
    t.integer  "dice_count"
    t.integer  "damage_type_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["damage_type_id"], name: "index_damages_on_damage_type_id", using: :btree
  end

  create_table "debts", force: :cascade do |t|
    t.float    "amount"
    t.integer  "from_id"
    t.integer  "to_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "accepted",       default: false
    t.string   "casheable_type"
    t.integer  "casheable_id"
    t.boolean  "collected"
    t.index ["casheable_type", "casheable_id"], name: "index_debts_on_casheable_type_and_casheable_id", using: :btree
  end

  create_table "equipment", force: :cascade do |t|
    t.string   "name"
    t.string   "equipment_category"
    t.string   "url"
    t.text     "desc"
    t.integer  "price"
    t.integer  "weight"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "equipment_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipment_choices", force: :cascade do |t|
    t.integer "amount"
    t.integer "equipment_set_id"
    t.index ["equipment_set_id"], name: "index_equipment_choices_on_equipment_set_id", using: :btree
  end

  create_table "equipment_equipment_categories", id: false, force: :cascade do |t|
    t.integer "equipment_id",          null: false
    t.integer "equipment_category_id", null: false
  end

  create_table "equipment_options", force: :cascade do |t|
    t.integer "equipment_choice_id"
    t.integer "equipment_id"
    t.index ["equipment_choice_id"], name: "index_equipment_options_on_equipment_choice_id", using: :btree
    t.index ["equipment_id"], name: "index_equipment_options_on_equipment_id", using: :btree
  end

  create_table "equipment_sets", force: :cascade do |t|
    t.integer "character_class_id"
    t.index ["character_class_id"], name: "index_equipment_sets_on_character_class_id", using: :btree
  end

  create_table "equipment_weapon_properties", id: false, force: :cascade do |t|
    t.integer "equipment_id",       null: false
    t.integer "weapon_property_id", null: false
  end

  create_table "gear_details", id: false, force: :cascade do |t|
    t.integer  "id",                 default: -> { "nextval('equipment_id_seq'::regclass)" }, null: false
    t.string   "name"
    t.string   "equipment_category"
    t.string   "url"
    t.text     "desc"
    t.integer  "price"
    t.integer  "weight"
    t.datetime "created_at",                                                                  null: false
    t.datetime "updated_at",                                                                  null: false
    t.string   "gear_category"
    t.string   "category_name",      default: "Adventuring Gear"
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
    t.integer  "options_policy"
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
    t.index ["parent_type", "parent_id"], name: "index_notes_on_parent_type_and_parent_id", using: :btree
    t.index ["user_id"], name: "index_notes_on_user_id", using: :btree
  end

  create_table "options", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "list_id"
    t.integer  "votes"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "voters"
    t.boolean  "has_pricetag",            default: false
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
    t.string   "polleable_type"
    t.integer  "polleable_id"
    t.index ["list_id"], name: "index_options_on_list_id", using: :btree
    t.index ["polleable_type", "polleable_id"], name: "index_options_on_polleable_type_and_polleable_id", using: :btree
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
    t.boolean  "archived"
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

  create_table "proficiencies", force: :cascade do |t|
    t.string   "prof_type"
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.integer  "number"
    t.text     "description"
    t.string   "location"
    t.string   "door"
    t.integer  "owner_id"
    t.integer  "subrenter_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["owner_id"], name: "index_rooms_on_owner_id", using: :btree
    t.index ["subrenter_id"], name: "index_rooms_on_subrenter_id", using: :btree
  end

  create_table "saving_throws", force: :cascade do |t|
    t.integer "character_class_id"
    t.integer "ability_scores_id"
    t.index ["ability_scores_id"], name: "index_saving_throws_on_ability_scores_id", using: :btree
    t.index ["character_class_id"], name: "index_saving_throws_on_character_class_id", using: :btree
  end

  create_table "tool_details", id: false, force: :cascade do |t|
    t.integer  "id",                 default: -> { "nextval('equipment_id_seq'::regclass)" }, null: false
    t.string   "name"
    t.string   "equipment_category"
    t.string   "url"
    t.text     "desc"
    t.integer  "price"
    t.integer  "weight"
    t.datetime "created_at",                                                                  null: false
    t.datetime "updated_at",                                                                  null: false
    t.string   "tool_category"
    t.string   "category_name",      default: "Tools"
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
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "is_admin",               default: false
    t.integer  "house_status",           default: 0
    t.integer  "act_as"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "vehicle_details", id: false, force: :cascade do |t|
    t.integer  "id",                 default: -> { "nextval('equipment_id_seq'::regclass)" }, null: false
    t.string   "name"
    t.string   "equipment_category"
    t.string   "url"
    t.text     "desc"
    t.integer  "price"
    t.integer  "weight"
    t.datetime "created_at",                                                                  null: false
    t.datetime "updated_at",                                                                  null: false
    t.string   "vehicle_category"
    t.string   "category_name",      default: "Mounts and Vehicles"
    t.string   "capacity"
    t.integer  "walking_speed"
    t.integer  "swimming_speed"
    t.integer  "flying_speed"
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree
  end

  create_table "weapon_details", id: false, force: :cascade do |t|
    t.integer  "id",                        default: -> { "nextval('equipment_id_seq'::regclass)" }, null: false
    t.string   "name"
    t.string   "equipment_category"
    t.string   "url"
    t.text     "desc"
    t.integer  "price"
    t.integer  "weight"
    t.datetime "created_at",                                                                         null: false
    t.datetime "updated_at",                                                                         null: false
    t.string   "weapon_category"
    t.string   "category_name",             default: "Weapon"
    t.string   "weapon_range"
    t.string   "category_range"
    t.integer  "normal_range"
    t.integer  "long_range"
    t.integer  "throw_range"
    t.integer  "long_throw_range"
    t.integer  "damage_roll_id"
    t.integer  "dual_wield_damage_roll_id"
    t.index ["damage_roll_id"], name: "index_weapon_details_on_damage_roll_id", using: :btree
    t.index ["dual_wield_damage_roll_id"], name: "index_weapon_details_on_dual_wield_damage_roll_id", using: :btree
  end

  create_table "weapon_properties", force: :cascade do |t|
    t.string   "name"
    t.text     "desc"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "admin_users", "users"
  add_foreign_key "base_class_proficiencies", "character_classes"
  add_foreign_key "base_class_proficiencies", "proficiencies", column: "proficiencies_id"
  add_foreign_key "base_starting_equipment", "character_classes"
  add_foreign_key "base_starting_equipment", "equipment"
  add_foreign_key "class_prof_choices", "character_classes"
  add_foreign_key "class_prof_options", "class_prof_choices"
  add_foreign_key "class_prof_options", "proficiencies"
  add_foreign_key "contents", "equipment"
  add_foreign_key "contents", "equipment", column: "pack_id"
  add_foreign_key "debts", "users", column: "from_id"
  add_foreign_key "debts", "users", column: "to_id"
  add_foreign_key "equipment_choices", "equipment_sets"
  add_foreign_key "equipment_options", "equipment"
  add_foreign_key "equipment_options", "equipment_choices"
  add_foreign_key "equipment_sets", "character_classes"
  add_foreign_key "lists", "users"
  add_foreign_key "notes", "users"
  add_foreign_key "options", "lists"
  add_foreign_key "options", "users"
  add_foreign_key "planner_events", "users"
  add_foreign_key "pricetags", "users"
  add_foreign_key "rooms", "users", column: "owner_id"
  add_foreign_key "rooms", "users", column: "subrenter_id"
  add_foreign_key "saving_throws", "ability_scores", column: "ability_scores_id"
  add_foreign_key "saving_throws", "character_classes"
  add_foreign_key "weapon_details", "damages", column: "damage_roll_id"
end
