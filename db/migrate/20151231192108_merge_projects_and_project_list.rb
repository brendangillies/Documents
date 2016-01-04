class MergeProjectsAndProjectList < ActiveRecord::Migration
  def self.up
  	drop_table :projects
  	rename_table :project_list, :projects
  end

  def self.down
  	rename_table :projects, :project_list
  	create_table :projects do |t|
    end
  end
end
