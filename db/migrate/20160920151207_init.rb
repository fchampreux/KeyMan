class Init < ActiveRecord::Migration[5.0]
  def change
    
    create_table "ciphers", force: :cascade do |t|
      t.string   "secteur",    limit: 100, null: false
      t.string   "clef",       limit: 100, null: false
      t.datetime "created_at",             null: false
      t.datetime "updated_at",             null: false
      t.integer  "user_id"
      t.string   "cipher_hash"
    end
  
    create_table "users", force: :cascade do |t|
      t.string   "nom",             limit: 100, null: false
      t.string   "prenom",          limit: 100, null: false
      t.string   "section",         limit: 100, null: false
      t.string   "email",           limit: 200, null: false
      t.datetime "created_at",                  null: false
      t.datetime "updated_at",                  null: false
      t.string   "password_digest"
      t.boolean  "is_admin"
      t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    end
  end
end
