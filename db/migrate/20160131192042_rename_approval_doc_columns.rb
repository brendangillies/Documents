class RenameApprovalDocColumns < ActiveRecord::Migration
  def change
		rename_column :approval_docs, :priority_code, :priority
		rename_column :approval_docs, :doc_type_code, :doc_type
		rename_column :approval_docs, :status_code, :status
  end
end
