class Task < ActiveRecord::Base
  belongs_to :item 
  has_one :project
  has_and_belongs_to_many :users
end
