class ApprovalDoc < ActiveRecord::Base
  has_one :master_po
  has_many :po_line_items
  has_and_belongs_to_many :tasks
end
