class RefactorCompanyId < ActiveRecord::Migration
  def change
		rename_column :company, :company_id, :id
  end
end
