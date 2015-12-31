class CreateApprovalDocs < ActiveRecord::Migration
  def up
    create_table :approval_docs do |t|
        t.integer  "line_item_id",  :limit => 4,   null: false
        t.binary   "is_required",   :limit => 1,   null: false
        t.integer  "status_code",   :limit => 4,   null: false
        t.string   "assigned_to",   :limit => 45
        t.datetime "required_by"
        t.integer  "priority_code", :limit => 4,   null: false
        t.integer  "doc_type_code", :limit => 4
        t.string   "desc",          :limit => 140
      end
      add_index "approval_docs", ["assigned_to"], name: "app_doc_assigned_to_idx", using: :btree
      add_index "approval_docs", ["doc_type_code"], name: "app_doc_type_cd_idx", using: :btree
      add_index "approval_docs", ["line_item_id"], name: "app_doc_item_id_idx", using: :btree
      add_index "approval_docs", ["priority_code"], name: "app_doc_priotity_cd_idx", using: :btree
      add_index "approval_docs", ["status_code"], name: "app_doc_status_cd_idx", using: :btree
      

      create_table "codes", :primary_key => "code_id" do |t|
        t.string "code_desc",    :limit => 140
        t.string "decode_value", :limit => 45
      end
      
      
      create_table "company_list", :primary_key => "company_id" do |t|
        t.string "comapny_name", :limit => 45
      end
      add_index "company_list", ["comapny_name"], name: "comapny_name_UNIQUE", unique: true, using: :btree
      
      
      create_table "project_list", :primary_key => "project_id" do |t|
        t.string "project_name", :limit => 45
        t.binary "is_active",    :limit => 1,  default: "0", null: false
      end
      add_index "project_list", ["project_name"], name: "project_name_UNIQUE", unique: true, using: :btree
      
      create_table "project_po_list" do |t|
        t.integer  "project_id",      :limit => 4,  null: false
        t.integer  "po_id",           :limit => 4,  null: false
        t.string   "project_name",    :limit => 45, null: false
        t.string   "po_num",          :limit => 45, null: false
        t.binary   "is_approved",     :limit => 1
        t.datetime "approve_by_date"
        t.datetime "approval_date"
        t.string   "approved_by",     :limit => 45
      end
      add_index "project_po_list", ["po_id"], name: "proj_po_link1_idx", using: :btree
      add_index "project_po_list", ["project_id"], name: "proj_link_idx", using: :btree
      
      
      create_table "test_1", :id => false do |t|
        t.integer "TEST", :limit => 4
      end

      create_table "user_company", :id => false do |t|
        t.string   "user_name",    :limit => 45, null: false
        t.integer  "company_id",   :limit => 1,  null: false
        t.binary   "is_active",    :limit => 1,  null: false
        t.datetime "created_date",            null: false
      end
      add_index "user_company", ["company_id"], name: "company_id_UNIQUE", unique: true, using: :btree
      add_index "user_company", ["user_name"], name: "user_name_UNIQUE", unique: true, using: :btree
      
      
      create_table "user_company_roles" do |t|
        t.string  "user_name",  :limit => 45, null: false
        t.integer "company_id", :limit => 4,  null: false
        t.integer "role_code",  :limit => 4,  null: false
        t.binary  "is_active",  :limit => 1
      end 
      add_index "user_company_roles", ["company_id"], name: "comp_role_comp_idx", using: :btree
      add_index "user_company_roles", ["role_code"], name: "comp_role_role_idx", using: :btree
      add_index "user_company_roles", ["user_name", "company_id", "role_code"], name: "company_role_unique", unique: true, using: :btree
      
  end
    
  def down
    drop_table :user_company_roles
    drop_table :user_company
    drop_table :test_1
    drop_table :project_po_list
    drop_table :project_list
    drop_table :company_list
    drop_table :codes
    drop_table :approval_docs
  end
    
end
