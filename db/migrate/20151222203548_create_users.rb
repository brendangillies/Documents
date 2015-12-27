class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
        t.string  "first_name", :limit => 45, null: false
        t.string  "last_name", :limit => 45, null: false
        t.string   "email", :default => "", :limit => 75, null: false
        t.string  "user_name",  :limit => 45, null: false
        t.integer "company_id", :limit => 4
        t.integer "role_code",  :limit => 4
        t.binary  "is_active",  :limit => 1
      end 
      add_index "users", ["user_name"], name: "user_name_idx", using: :btree
      add_index "users", ["company_id"], name: "company_po_idx", using: :btree
      add_index "users", ["role_code"], name: "role_code_idx", using: :btree
  end
  
  def down
    drop_table :users
  end
  
end
