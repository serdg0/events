class UsersController < ApplicationController
  def index
    @users=User.all
  end

  def all
    @users=User.all
  end
  def new
    @user = User.new
  end

  def show
    @user = User.find(current_user.id)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.with(user: @user).account_activation.deliver_later
      flash[:success] = "Welcome to the Sample App!"
      log_in(@user)
      redirect_to @user
    else
      flash.now[:danger] = 'Not a valid user. Try again.'
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
