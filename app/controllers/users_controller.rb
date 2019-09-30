class UsersController < ApplicationController
  def index

  end
  def new
    @user = User.new
  end

  def show

  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else

    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
