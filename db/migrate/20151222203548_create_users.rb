class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
        t.string  "user_name",  :limit => 45, null: false
        t.integer "company_id", :limit => 4,  null: false
        t.integer "role_code",  :limit => 4,  null: false
        t.binary  "is_active",  :limit => 1
      end 
      add_index "users", ["company_id"], name: "company_po_idx", using: :btree
      add_index "users", ["role_code"], name: "role_code_idx", using: :btree
  end
  
  def down
    drop_table :users
  end
  
end
