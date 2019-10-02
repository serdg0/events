class UserMailer < ApplicationMailer
  def account_activation
    @user = params[:user]

    mail(to: @user.email, subject: "Welcome to the Agendator!")
  end
end
