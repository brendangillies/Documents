class MasterPo < ActiveRecord::Base
  belongs_to :project, -> {readonly :project}
  has_many :items
  
  #scope :sorted, lambda { order("master_po.position ASC")}

  scope :sorted, lambda { order("master_pos.po_id DESC")}
  
end
