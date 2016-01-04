class User < ActiveRecord::Base
  has_many :tasks
  has_many :approval_comments
end
