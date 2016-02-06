class AddDatesToProjects < ActiveRecord::Migration
  def change
  	rename_column :projects, :project_name, :project
		add_column :projects, :date_opened, :date
		add_column :projects, :date_closed, :date
		add_reference :projects, :company_list, index: true
  end
end
