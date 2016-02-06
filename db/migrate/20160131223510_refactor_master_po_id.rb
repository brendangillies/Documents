class RefactorMasterPoId < ActiveRecord::Migration
  def change
		rename_column :master_pos, :po_id, :id
  end
end
