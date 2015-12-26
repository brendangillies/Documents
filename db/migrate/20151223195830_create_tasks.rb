class CreateTasks < ActiveRecord::Migration
  def up
    create_table :tasks do |t|
      t.integer "position", :null => false
      t.string  "description", :limit => 200 
      t.string  "created_by", :null => false
      t.integer "company_id", :null =>false
      t.integer "project_id", :null => false
      
    end
    add_index "tasks", ["company_id"], name: "company_po_idx", using: :btree
    add_index "tasks", ["project_id"], name: "project_id_idx", using: :btree
  end
  
  def down
    drop_table :tasks
  end
end
