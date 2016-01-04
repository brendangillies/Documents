class ApprovalDoc < ActiveRecord::Base
  has_one :master_po
  has_many :tasks
  has_many :approval_comments
  belongs_to :item
  validates :priority_code, presence: true
  validates :doc_type_code, presence: true
  validates :desc, presence: true
end
