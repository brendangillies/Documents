class MasterPo < ActiveRecord::Base
  belongs_to :project, -> {readonly :project}
  has_many :items
	validates :po_num, presence:true, length: {maximum: 45}
	validates :company_id, presence:true, length: {maximum: 4}
  
  #scope :sorted, lambda { order("master_po.position ASC")}

  scope :sorted, lambda { order("master_pos.po_id DESC")}
  
end
