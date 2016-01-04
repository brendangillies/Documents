class RemoveNulls < ActiveRecord::Migration
  def change
  	rename_column :approval_docs, :line_item_id, :item_id
  	change_column_null :approval_docs, :item_id, true
  	change_column_null :approval_docs, :is_required, true
  	change_column_null :approval_docs, :status_code, true
  	change_column_null :approval_docs, :priority_code, true

  	rename_column :approval_hists, :object_id, :approval_doc_id
  	change_column_null :approval_hists, :approval_doc_id, true
  	change_column_null :approval_hists, :approval_code, true
  	change_column_null :approval_hists, :update_date, true
  	change_column_null :approval_hists, :updated_by, true

  	change_column_null :items, :po_id, true
  	change_column_null :items, :line_item_num, true
  	change_column_null :items, :docs_required, true
  	change_column_null :items, :status_code, true

  	change_column_null :project_po_list, :project_id, true
  	change_column_null :project_po_list, :po_id, true
  	change_column_null :project_po_list, :project_name, true
  	change_column_null :project_po_list, :po_num, true

  	change_column_null :master_pos, :po_num, true
  	change_column_null :master_pos, :created_date, true

  	change_column_null :projects, :is_active, true

  	change_column_null :tasks, :position, true
  	change_column_null :tasks, :created_by, true
  	change_column_null :tasks, :company_id, true
  	change_column_null :tasks, :project_id, true

  	change_column_null :user_company, :user_name, true
  	change_column_null :user_company, :company_id, true
  	change_column_null :user_company, :is_active, true
  	change_column_null :user_company, :created_date, true

  	change_column_null :user_company_roles, :user_name, true
  	change_column_null :user_company_roles, :company_id, true
  	change_column_null :user_company_roles, :role_code, true

  	change_column_null :users, :first_name, true
  	change_column_null :users, :last_name, true
  	change_column_null :users, :user_name, true
  	change_column_null :users, :email, true


  end
end
