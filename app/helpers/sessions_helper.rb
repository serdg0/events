# frozen_string_literal: true

module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end

  def user_available
    current_user.name if logged_in?
  end

  def users_view
    link_to 'Users', user_path
  end

  def logged_view
    if logged_in?
      link_to 'Log out', logout_path, method: :delete
    else
      link_to 'Login', login_path
    end
  end

  def logged_post
    if logged_in?
      link_to 'Create Event', new_event_path
    else
      link_to 'Sign Up', signup_path
    end
  end

  def logged_profile
    if logged_in?
      link_to 'Dashboard', dashboard_path
    else
      link_to 'Home', root_path
    end
  end
end
