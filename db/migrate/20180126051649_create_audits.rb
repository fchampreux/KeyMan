class CreateAudits < ActiveRecord::Migration[5.0]
  def change
    create_table "access_lists", force: :cascade do |t|
      t.integer  "key_id",                   null: false
      t.integer  "user_id",                  null: false
      t.boolean  "allow_encrypt", default: true
      t.boolean  "allow_decrypt", default: false
      t.date     "valid_from",               null: false
      t.date     "valid_until",              null: false
      t.datetime "created_at",               null: false
      t.datetime "updated_at",               null: false
      t.string   "created_by",   limit: 100
      t.string   "updated_by",   limit: 100
    end
    
    create_table "audit_trails", force: :cascade do |t|
      t.integer  "user_id",                  null: false
      t.string   "action",                   null: false 
      t.integer  "object_id",                null: false
      t.string   "object_class",  limit: 100
      t.string   "object_name",   limit: 100
      t.string   "server_name",   limit: 100
      t.string   "table_name",    limit: 100
      t.string   "column_name",   limit: 100
      t.string   "description",   limit: 1000
      t.boolean  "used_encrypt", default: false
      t.boolean  "used_decrypt", default: false
      t.datetime "created_at",               null: false
      t.string   "created_by",   limit: 100
    end    
        
  end
end
