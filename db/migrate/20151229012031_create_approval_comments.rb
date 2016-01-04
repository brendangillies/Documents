class CreateApprovalComments < ActiveRecord::Migration
  def up
    create_table :approval_comments do |t|
      t.references :approval_doc, index: true
      t.references :user, index: true
      t.text :body

      t.timestamps
    end
  end
  def down
  	drop_table :approval_comments
  end
  
end
