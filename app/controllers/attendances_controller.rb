class AttendancesController < ApplicationController
  def new
    @attendace = Attendance.new
  end
  def create
    @user = User.find(current_user.id)
    @checkbox_hash= params[:attendance]
    @select_hash= params[:select_list]
    check_ids_invite.each do |id|
      #@attendance = Attendance.new(user_id:id,event_id: check_event_invite,invitation_sender: @user.id)
      @attendance = Event.find(check_event_invite)
      #@attendance  = Event.find(1)
      @attendance.attendees << User.find(id)
      if @attendance.save
        flash[:success]= "Felicidades has invitado a tu amigo !!"
        # redirect_to invitations_path
      else
        flash[:danger]= "Error mi amigo ID_invite: #{check_ids_invite} ** ID Event:  #{check_event_invite} ** Invitation_sender : #{@user.id}"
      end
    end
    UserMailer.with(user: @user,eventid: params[:select_list],checkboxs: params[:attendance],emails: check_users_invite).invitation.deliver_now
  end
end
