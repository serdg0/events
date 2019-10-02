class UserMailer < ApplicationMailer
  def account_activation
    @user = params[:user]

    mail(to: "agendator2019@gmail.com", subject: "Welcome to the Agendator!")
  end
end
