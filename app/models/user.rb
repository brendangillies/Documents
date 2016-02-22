class User < ActiveRecord::Base
	attr_accessor :remember_token

  before_save { self.email = email.downcase}
  has_secure_password
  has_many :tasks
  has_and_belongs_to_many :tasks
  has_many :approval_comments
  validates :first_name, presence:true, length: {maximum: 45}
  validates :last_name, presence:true, length: {maximum: 45}
  validates :email, presence:true, length: {maximum: 75}, email: true, uniqueness: true
  validates :username, length: {maximum: 45}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6 }

	  def User.digest(string)
	    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
	                                                  BCrypt::Engine.cost
	    BCrypt::Password.create(string, cost: cost)
	  end

		def User.new_token
			SecureRandom.urlsafe_base64
		end
    
		#creates a token to remember the user in the database and stores the secure hash of the token
  	def remember
			self.remember_token = User.new_token
			update_attribute(:remember_digest, User.digest(remember_token))
		end
		
		#compares the log in session cookie with its secure hash in the DB
		def authenticated?(remember_token)
			return false if remember_digest.nil?
			BCrypt::Password.new(remember_digest).is_password?(remember_token)
		end

		def forget
			update_attribute(:remember_digest, nil)
		end
end
