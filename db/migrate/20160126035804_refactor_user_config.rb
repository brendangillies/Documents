class RefactorUserConfig < ActiveRecord::Migration
  def change
		remove_column :users, :company_id
		remove_column :users, :role_code
		remove_column :users, :is_active

		create_table :user_config do |t|
			t.string :company
			t.string :role
			t.integer :customer_id
		end
  end
end
