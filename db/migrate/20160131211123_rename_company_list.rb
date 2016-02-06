class RenameCompanyList < ActiveRecord::Migration
  def change
		change_table :company_list do |t|
			t.rename :comapny_name, :name
			t.string :type
 	 end
		rename_table :company_list, :company
	end
end
