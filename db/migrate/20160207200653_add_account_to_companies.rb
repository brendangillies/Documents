class AddAccountToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :account, :string
  end
end
