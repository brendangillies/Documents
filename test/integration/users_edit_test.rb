require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
	def setup
		@user = users(:bennyB)
	end

	test "Unsuccesful user edit" do
		log_in_as(@user)
		get edit_user_path(@user.id)
		assert_template 'users/edit'
		patch user_path(@user), user: {username: "", email: ""}
		assert_template 'users/edit'
	end

	test "succesful user edit" do
		log_in_as(@user)
		get edit_user_path(@user)
		assert_template 'users/edit'
		patch user_path(@user), user: {first_name: "B-rizzle", email: "Benji@example.com",
																		last_name: "BigDick", password: "", password_confirmation: ""}
		assert_not flash.empty?
		assert_redirected_to @user
		@user.reload
		assert_equal @user.email, "benji@example.com"
		end
end
