class ApprovalComment < ActiveRecord::Base
  belongs_to :approval_doc
  belongs_to :user
end
