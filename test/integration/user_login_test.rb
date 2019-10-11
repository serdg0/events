# frozen_string_literal: true

require 'test_helper'
# require './app/helpers/sessions_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.new(name: 'Example', email: 'example@user.com')
  end

  test 'login user' do
    get login_path
    assert post users_path, params: { user: { name: @user.name,
                                              email: @user.email } }
  end

  test 'login with invalid information' do
    get login_path
    post login_path, params: { session: { email: '' } }
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test 'login with valid information' do
    get login_path
    post login_path, params: { session: { email: @user.email } }
    assert_response :success
  end

  test 'valid signup' do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: 'Example User',
                                         email: 'user@example.com' } }
    end
  end
end
