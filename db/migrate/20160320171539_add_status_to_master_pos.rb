class AddStatusToMasterPos < ActiveRecord::Migration
  def change
    add_column :master_pos, :status, :string, :default => 'Pending'
  end
end
