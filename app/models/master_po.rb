class MasterPo < ActiveRecord::Base
  belongs_to :project
  has_many :items
  
  #scope :sorted, lambda { order("master_po.position ASC")}

  
end
