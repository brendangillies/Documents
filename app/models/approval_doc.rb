class ApprovalDoc < ActiveRecord::Base
  has_one :master_po
  has_many :po_line_items
  has_many :users

end
