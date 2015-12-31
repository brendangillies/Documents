class CreateProjects < ActiveRecord::Migration
  def up
    create_table :projects do |t|
    end
  end
  
  def down
    drop_table :projects
  end

end
