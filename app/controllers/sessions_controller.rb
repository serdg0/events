class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'You dont exist. Sign up!'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
