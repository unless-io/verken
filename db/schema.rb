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

ActiveRecord::Schema.define(version: 20170515183356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "criteria", force: :cascade do |t|
    t.integer  "exploration_id"
    t.string   "title"
    t.string   "question_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["exploration_id"], name: "index_criteria_on_exploration_id", using: :btree
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "criterium_id"
    t.integer  "user_id"
    t.integer  "rating"
    t.string   "status",       default: "pending"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["criterium_id"], name: "index_evaluations_on_criterium_id", using: :btree
    t.index ["item_id"], name: "index_evaluations_on_item_id", using: :btree
    t.index ["user_id"], name: "index_evaluations_on_user_id", using: :btree
  end

  create_table "explorations", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "creator_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["creator_id"], name: "index_explorations_on_creator_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.integer  "exploration_id"
    t.string   "title"
    t.text     "description"
    t.string   "photo"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.float    "score",          default: 0.0
    t.index ["exploration_id"], name: "index_items_on_exploration_id", using: :btree
  end

  create_table "links", force: :cascade do |t|
    t.integer  "item_id"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_links_on_item_id", using: :btree
  end

  create_table "participants", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "exploration_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["exploration_id"], name: "index_participants_on_exploration_id", using: :btree
    t.index ["user_id"], name: "index_participants_on_user_id", using: :btree
  end

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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "criteria", "explorations"
  add_foreign_key "evaluations", "criteria"
  add_foreign_key "evaluations", "items"
  add_foreign_key "evaluations", "users"
  add_foreign_key "explorations", "users", column: "creator_id"
  add_foreign_key "items", "explorations"
  add_foreign_key "links", "items"
  add_foreign_key "participants", "explorations"
  add_foreign_key "participants", "users"
end
