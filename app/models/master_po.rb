class MasterPo < ActiveRecord::Base
  has_one :project
  
  has_many :po_line_items
  has_many :approval_docs

  
end
