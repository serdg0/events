# frozen_string_literal: true

class AttendancesController < ApplicationController
  def new
    @attendace = Attendance.new
  end

  def create
    @user = User.find(current_user.id)
    @checkbox_hash = params[:attendance]
    @select_hash = params[:select_list]
    flash[:danger] = ''
    check_users.each do |user|
      event = Event.find(params[:select_list])
      if invited?(user, event)
        @attendance = Event.find(check_event_invite)
        @attendance.attendees << User.find_by(email: user.email)
        if @attendance.save
          flash.discard(:danger)
          flash[:success] = 'Felicidades has invitado a tu amigo !!'
          UserMailer.with(user: @user, eventid: params[:select_list],
                          checkboxs: params[:attendance], emails: check_users_invite).invitation.deliver_now
        else
          flash[:danger] + "Error mi amigo ID_invite: #{check_ids_invite} ** ID Event:  #{check_event_invite} ** Invitation_sender : #{@user.id}"
        end
      else
        flash[:danger] << "#{User.find_by(email: user.email).name}, "
      end
    end
  end
end
