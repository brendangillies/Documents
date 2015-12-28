class PoLineItem < ActiveRecord::Base
  belongs_to :master_po
  has_many :approval_docs
  has_many :tasks

end
