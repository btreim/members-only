require 'test_helper'

class LoggedInUserViewTest < ActionDispatch::IntegrationTest
	def setup
		@user = User.new({email: 'test@example.com', password:'password', 
										  													 password_confirmation: 'password'})
		@user.save
	end


	test "should show author to logged in user" do 
		get login_path
		post login_path, params:{ session: {email: 'test@example.com', password: 'password'}}
		post posts_path, params:{ post: {title:"testing", body:"example"}}
		follow_redirect!
		# follow_redirect!
		assert_select "p", {:count=>1, :text=>"#{@user.email}"}
	end
end

