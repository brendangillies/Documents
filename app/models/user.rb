class User < ActiveRecord::Base
  before_save { self.email = email.downcase}
  has_secure_password
  has_many :tasks
  has_many :approval_comments
  validates :first_name, presence:true, length: {maximum: 45}
  validates :last_name, presence:true, length: {maximum: 45}
  validates :email, presence:true, length: {maximum: 75}, email: true, uniqueness: true
  validates :username, length: {maximum: 45}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6 }
end
