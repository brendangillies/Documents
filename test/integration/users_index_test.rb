require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
	def setup
		@admin_user = users(:bennyB)
		@non_admin = users(:user_1)
	end

	test "pagination on admin users index" do
		log_in_as(@admin_user)
		get users_path
		assert_template 'users/index'
		assert_select 'div.pagination'
		User.paginate(page: 1, per_page: 20).each do |user|
			assert_select 'a[href=?]', user_path(user), text: user.username
			unless user == @admin_user
				 assert_select 'a[href=?]', user_path(user), text: 'delete'
			end
		end
		assert_difference 'User.count', -1 do
			delete user_path(@non_admin)
		end
	end


	test "pagination on non admin users index" do
		log_in_as(@non_admin)
		get users_path
		assert_template 'users/index'
		assert_select 'div.pagination'
		User.paginate(page: 1, per_page: 20).each do |user|
			assert_select 'a[href=?]', user_path(user), text: user.username
		  assert_select 'a', text: 'delete', count: 0
		end
	end

end

