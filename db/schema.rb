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

ActiveRecord::Schema.define(version: 20170217075210) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "actions", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "issue_id",                        null: false
    t.uuid     "category_id",                     null: false
    t.string   "eyebrow"
    t.string   "title",                           null: false
    t.text     "summary"
    t.text     "body"
    t.string   "time_commitment"
    t.integer  "priority",        default: 0,     null: false
    t.boolean  "event",           default: false, null: false
    t.string   "location"
    t.datetime "happening_at"
    t.text     "image_data"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["category_id"], name: "index_actions_on_category_id", using: :btree
    t.index ["issue_id"], name: "index_actions_on_issue_id", using: :btree
  end

  create_table "categories", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name",       null: false
    t.text     "icon_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "features", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.integer  "position",   default: 0, null: false
    t.uuid     "action_id",              null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["action_id"], name: "index_features_on_action_id", using: :btree
  end

  create_table "issues", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name",       null: false
    t.text     "lead"
    t.text     "body"
    t.text     "icon_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "avatar_data"
    t.string   "facebook"
    t.string   "medium"
    t.string   "twitter"
    t.uuid     "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "email",                                      null: false
    t.string   "encrypted_password", limit: 128,             null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128,             null: false
    t.integer  "role",                           default: 0, null: false
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
  end

  add_foreign_key "actions", "categories", on_delete: :restrict
  add_foreign_key "actions", "issues", on_delete: :restrict
  add_foreign_key "features", "actions"
  add_foreign_key "profiles", "users", on_delete: :restrict
end
