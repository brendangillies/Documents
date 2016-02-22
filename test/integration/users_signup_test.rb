require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

	test "invalid signup information" do
		get users_path
		assert_no_difference 'User.count' do
			post users_path, user: {username: "", email: "user@example",
													password: "password", 
													password_confirmation: "not_password"}
		end
	
		assert_template 'users/new'
	end

	test "valid signup information" do
		get users_path
		assert_difference 'User.count' do
			post users_path, user: {username: "NewUser45", email: "user@example.com",
													 first_name: "User", last_name: "McYeezSteez",
													password: "password123!", 
													password_confirmation: "password123!"}
		end
											
		follow_redirect!
		assert_template 'users/show'
		assert is_logged_in?
	end
																											
end
