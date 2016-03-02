class RenameCompany < ActiveRecord::Migration
  def self.up
		rename_table :company, :companies
	end

	def self.down
		rename_table :companies, :company
  end
end
