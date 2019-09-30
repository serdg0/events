module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end

  def user_available
    if logged_in?
      current_user.name
    else
      signup_path
      logout_path
    end
  end

  def logged_view
    #if-else del header
  end

end
