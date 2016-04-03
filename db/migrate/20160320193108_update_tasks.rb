class UpdateTasks < ActiveRecord::Migration
  def change
		rename_column :tasks, :position, :priority
		remove_column :tasks, :company_id, :integer
		add_column :tasks, :status, :string, :default => 'Open'
    add_column(:tasks, :created_at, :datetime)
    add_column(:tasks, :updated_at, :datetime)
		add_column :tasks, :assignable_id, :integer
		add_column :tasks, :assignable_type, :string

		add_index :tasks, :assignable_id
  end
end
