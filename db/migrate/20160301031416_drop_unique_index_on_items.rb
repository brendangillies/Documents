class DropUniqueIndexOnItems < ActiveRecord::Migration
  def change
		remove_index :items, :name => 'po_item_codes_idx'
		remove_index :items, :name => 'line_item_num_UNIQUE'
  end
end
