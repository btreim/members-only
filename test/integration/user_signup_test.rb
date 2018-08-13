require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

	test "invalid signup" do 
		get new_user_path
		assert_no_difference 'User.count' do 
			assert_template 'users/new'
			post users_path, params: { user: { email: "  ",
																				 password: " ",
																				 password_confirmation: "  " }}
		end
		assert_template 'users/new'
		assert_select 'p.error'
	end

	test "valid signup" do
		get new_user_path
		assert_difference 'User.count', 1 do 
			post users_path, params: { user: { email: "test@example.com",
																				 password: "password",
																				 password_confirmation: "password" }}
		end 
	end
end
