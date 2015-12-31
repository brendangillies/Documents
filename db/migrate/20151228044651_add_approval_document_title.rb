class AddApprovalDocumentTitle < ActiveRecord::Migration
  def up
  	add_column :approval_docs, :name, :string
  end

  def down
  	remove_column :approval_docs, :name, :string
  end
end
