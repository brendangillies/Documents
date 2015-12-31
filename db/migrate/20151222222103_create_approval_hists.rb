class CreateApprovalHists < ActiveRecord::Migration


      def up
        create_table "approval_hists" do |t|
          t.integer  "object_id",     :limit => 4,  null: false
          t.integer  "approval_code", :limit => 4,  null: false
          t.datetime "update_date",                 null: false
          t.string   "updated_by",    :limit => 45, null: false
        end
        add_index "approval_hists", ["updated_by"], name: "update_by_user_idx", using: :btree
      end
  
      def down
        drop_table :approval_hists
      end

end
