class ApprovalDoc < ActiveRecord::Base
  has_one :master_po
  has_many :tasks
  has_many :approval_comments
  belongs_to :item
  validates :doc_type, presence: true
end
