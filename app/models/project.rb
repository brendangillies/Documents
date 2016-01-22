class Project < ActiveRecord::Base
  belongs_to :company_list
  has_many :master_pos

end
