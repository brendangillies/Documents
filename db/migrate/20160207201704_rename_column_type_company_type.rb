class RenameColumnTypeCompanyType < ActiveRecord::Migration
  def change
		rename_column :companies, :type, :company_type
  end
end
