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

ActiveRecord::Schema.define(version: 20171003042123) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string   "name",        limit: 100,                null: false
    t.string   "code",        limit: 30,                 null: false
    t.text     "description"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "created_by",  limit: 100
    t.string   "updated_by",  limit: 100
    t.boolean  "is_active",               default: true
    t.index ["code"], name: "index_groups_on_code", unique: true, using: :btree
    t.index ["name"], name: "index_groups_on_name", unique: true, using: :btree
  end

  create_table "keys", force: :cascade do |t|
    t.string   "name",        limit: 100,                null: false
    t.text     "description"
    t.integer  "group_id"
    t.integer  "user_id"
    t.string   "key_hash",    limit: 256
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "created_by",  limit: 100
    t.string   "updated_by",  limit: 100
    t.date     "valid_from",                             null: false
    t.date     "valid_until",                            null: false
    t.boolean  "is_active",               default: true
    t.index ["group_id"], name: "index_keys_on_group", using: :btree
    t.index ["key_hash"], name: "index_keys_on_hash", unique: true, using: :btree
    t.index ["name", "group_id"], name: "index_keys_on_name", unique: true, using: :btree
    t.index ["user_id"], name: "index_keys_on_user", using: :btree
  end

  create_table "parameters", force: :cascade do |t|
    t.string   "name",        limit: 100, null: false
    t.string   "list_name",   limit: 100
    t.text     "description"
    t.string   "code",        limit: 30,  null: false
    t.string   "value",       limit: 100, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "created_by",  limit: 100
    t.string   "updated_by",  limit: 100
    t.index ["code"], name: "index_parameters_on_code", unique: true, using: :btree
    t.index ["name"], name: "index_parameters_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 100,                  null: false
    t.string   "first_name",             limit: 100,                  null: false
    t.text     "description"
    t.boolean  "is_admin",                            default: false
    t.string   "pki",                    limit: 4000
    t.string   "user_name",              limit: 30,                   null: false
    t.string   "language",               limit: 3,                    null: false
    t.integer  "group_id",                                            null: false
    t.integer  "role_id",                                             null: false
    t.string   "section",                limit: 100,  default: ""
    t.string   "email",                               default: "",    null: false
    t.string   "encrypted_password",                  default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",                     default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "created_by",             limit: 100
    t.string   "updated_by",             limit: 100
    t.boolean  "is_active",                           default: true
    t.string   "api_token",              limit: 100
    t.integer  "api_token_count",                     default: 1
    t.datetime "api_token_validity"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
    t.index ["user_name"], name: "index_users_on_user_name", unique: true, using: :btree
  end

end
