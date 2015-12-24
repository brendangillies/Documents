class PoLineItem < ActiveRecord::Base
  has_one :master_po
  has_many :approval_docs

end
