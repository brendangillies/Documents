class UpdateProjectsReference < ActiveRecord::Migration
def change
	rename_column :projects, :company_list_id, :company_id
end
