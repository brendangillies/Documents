class Project < ActiveRecord::Base
  has_many :master_pos
  has_many :users

end
