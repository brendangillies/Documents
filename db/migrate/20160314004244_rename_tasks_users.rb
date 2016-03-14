class RenameTasksUsers < ActiveRecord::Migration
  def change
		rename_table :tasks_users, :user_tasks
  end
end
