class ProjectList < ActiveRecord::Base
  belongs_to :company_list
  has_many :master_pos
  has_many :users

end
