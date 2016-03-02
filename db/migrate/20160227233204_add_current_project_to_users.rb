class AddCurrentProjectToUsers < ActiveRecord::Migration
  def change
		add_column :users, :current_project, :integer
  end
end
