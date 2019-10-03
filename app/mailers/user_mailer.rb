class UserMailer < ApplicationMailer
  def account_activation
    @user = params[:user]

    mail(to: @user.email, subject: "Welcome to the Agendator!")
  end

  def invitation
    @user  = params[:user]
    @event = params[:event]
    mail(to: @user.email, subject: "You've been invited to #{@event.title}!")
    #check_users_invite.each do |mails|
     # mail(to: mails, subject: "You've been invited to #{@event.title}!")
    #end

  end
end
