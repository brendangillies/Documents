class RenamePoIdColumnInItems < ActiveRecord::Migration
  def change
		rename_column :items, :po_id, :master_po_id
  end
end
