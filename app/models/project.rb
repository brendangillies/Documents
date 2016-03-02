class Project < ActiveRecord::Base
  belongs_to :company
  has_many :master_pos
	has_many :project_users
	has_many :users, :through => :project_users
end
