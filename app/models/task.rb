class Task < ActiveRecord::Base
  belongs_to :item 
  belongs_to :project
  belongs_to :master_po
  
  has_and_belongs_to_many :users
end
