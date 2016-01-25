class Item < ActiveRecord::Base
  belongs_to :master_po, -> {includes :project}
  has_many :approval_docs
  has_many :tasks

end
