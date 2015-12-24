class CreatePoLineItems < ActiveRecord::Migration
  def up
    create_table :po_line_items , :primary_key => "item_id" do |t|
        t.integer  "po_id",            :limit => 4,                                         null: false
        t.string   "line_item_num",    :limit => 45,                                        null: false
        t.string   "line_item_desc",   :limit => 45
        t.binary   "docs_required",    :limit => 1,                           default: "0", null: false
        t.decimal  "price",                       precision: 10, scale: 2
        t.integer  "status_code",      :limit => 4,                                         null: false
        t.datetime "approved_by_date"
        t.integer  "doc_list_id",      :limit => 4
      end
      add_index "po_line_items", ["line_item_num"], name: "line_item_num_UNIQUE", unique: true, using: :btree
      add_index "po_line_items", ["po_id"], name: "po_master_item_link_idx", using: :btree
      add_index "po_line_items", ["status_code"], name: "po_item_codes_idx", using: :btree


  end
    
    def down
      drop_table :po_line_items
    end
end
