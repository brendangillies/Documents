class RenameStatusCodeInItems < ActiveRecord::Migration
  def change
		rename_column :items, :status_code, :status
		change_column :items, :status, :string
		remove_column :items, :doc_list_id
		change_column :items, :docs_required, :integer
  end
end
