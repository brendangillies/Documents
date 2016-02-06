class RefactorItemId < ActiveRecord::Migration
  def change
		rename_column :items, :item_id, :id
  end
end
