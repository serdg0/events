# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def account_activation
    @user = params[:user]

    mail(to: @user.email, subject: 'Welcome to the Agendator!')
  end

  def invitation
    mails = params[:emails]
    event = Event.find(params[:eventid])
    mail(to: 'agendator2019@gmail.com', name: 'Agendator Admin Site', subject: "You've been invited to #{event.title}!",
         bcc: mails)
  end
end
