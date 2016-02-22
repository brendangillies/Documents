require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
	@user = User.new(email: "user@example.com", first_name: "test", last_name: "user", password: "Testing123!", password_confirmation: "Testing123!")
	end

	test "should be valid" do
		assert @user.valid?
	end

	test "firt name should be present" do
		@user.first_name = "  "
		assert_not @user.valid?
	end
	test "last name should be present" do
		@user.last_name = ""
		assert_not @user.valid?
	end
	test "email should not be too long" do
		@user.email = "a" * 244 + "@example.com"
		assert_not @user.valid?
	end
	test "first name should not be too long" do
		@user.first_name = "a" * 100
		assert_not @user.valid?
	end
	test "last name should not be too long" do
		@user.last_name = "a" * 100
		assert_not @user.valid?
	end
	test "email validation should accept valid email" do
		valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
        	valid_addresses.each do |valid_address|
      		@user.email = valid_address
		assert @user.valid?, "#{valid_address.inspect} should be valid"							
		end
	end
	
	test "email validation should reject invalid email" do
		invalid_addresses = %w[user@example,com USER.foo.COM A_US-ER@foo_bar.org alice+bob@bazcn]
        	invalid_addresses.each do |invalid_address|
      		@user.email = invalid_address
		assert_not @user.valid?, "#{invalid_address.inspect} should be valid"							
		end
	end

	test "email addresses should be unique" do
		duplicate_user = @user.dup
		duplicate_user.email = @user.email.upcase
		@user.save
		assert_not duplicate_user.valid?
	end

	test "password should be present and nonblank" do
		@user.password = @user.password_confirmation = " " *6
		assert_not @user.valid?
	end 

	test "password should be at least 6 characters" do
		@user.password = @user.password_confirmation = "a" *5
		assert_not @user.valid?
	end 

	test "authenticated? should return false if nil" do
		assert_not @user.authenticated?('')
	end
end
