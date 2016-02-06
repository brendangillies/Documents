class ActuallyUpdateProjectsReference < ActiveRecord::Migration
  def up
		execute "ALTER TABLE `projects` CHANGE COLUMN `project_id` `project_id` INT(11) NOT NULL, DROP PRIMARY KEY;"
		add_column :projects, :id, :primary_key
  end

	def down
		execute "ALTER TABLE `projects` CHANGE COLUMN `id` `id` INT(11) NOT NULL, DROP PRIMARY KEY;"
		add_column :projects, :project_id, :primary_key
	end
end
