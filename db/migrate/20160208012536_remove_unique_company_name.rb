class RemoveUniqueCompanyName < ActiveRecord::Migration
  def change
		remove_index(:companies, :name => "comapny_name_UNIQUE")
  end
end
