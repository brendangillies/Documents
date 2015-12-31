class CreateMasterPos < ActiveRecord::Migration
  def up
    create_table "master_pos", :primary_key => "po_id" do |t|
      t.string  "po_num",       :limit => 45, null: false
      t.date    "created_date",            null: false
      t.integer "project_id",   :limit => 4 #foreign key
      t.binary  "is_active",    :limit => 1
      t.integer "company_id",   :limit => 4 #foreign key
    end
    add_index "master_pos", ["company_id"], name: "company_po_idx", using: :btree
    add_index "master_pos", ["project_id"], name: "po_project_fk_idx", using: :btree
  end
  def down
    drop_table :master_pos
  end
  
end
