class RefactorProjectPoList < ActiveRecord::Migration
  def change
		rename_column :project_po_list, :po_id, :master_po_id
		remove_column :project_po_list, :project_name
		remove_column :project_po_list, :po_num
		remove_column :project_po_list, :is_approved
		remove_column :project_po_list, :approve_by_date
		remove_column :project_po_list, :approved_by
		remove_column :project_po_list, :id
  end
end
