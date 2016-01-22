class ApprovalHist < ActiveRecord::Base
	belongs_to :approval_doc
	has_one :approval_doc
end
