class MergeItemsAndPoLineItems < ActiveRecord::Migration
  def self.up
  	rename_table :po_line_items, :items
  end

  def self.down
  	rename_table :items, :po_line_items
  end
end
