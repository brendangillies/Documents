class CreateTasks < ActiveRecord::Migration
  def up
    create_table :tasks do |t|
    end
  end
  
  def down
    drop_table :tasks
  end
end
