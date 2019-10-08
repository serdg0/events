require 'test_helper'
require './app/helpers/sessions_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.new(name:'Example', email:'example@user.com')
  end

  test 'login user' do
    get login_path
    assert post users_path, params: { user: { name:  "Example User",
                                       email: "user@example.com"} }
  end

  test 'logout user' do
    get login_path
    post login_path, params: { user: { email: @user.email } }
    post login_path, params: { session: { user_id: @user.id} }
    assert logged_in?
    delete logout_url
    assert_not logged_in?
  end
  test 'valid signup' do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com"} }
    end
    end
  end



