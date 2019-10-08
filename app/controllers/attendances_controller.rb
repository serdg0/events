class AttendancesController < ApplicationController
  def new
    @attendace = Attendance.new
  end
  def create
    @user = User.find(current_user.id)
    @checkbox_hash= params[:attendance]
    @select_hash= params[:select_list]
   # flash[:danger]="Ya haz invitado a :"
    flash[:danger] =   ""
    error_arr=[]
    check_users.each do |user|
      event = Event.find(params[:select_list])
      if invited?(user,event)
        #@attendance = Attendance.new(user_id:id,event_id: check_event_invite,invitation_sender: @user.id)
        @attendance = Event.find(check_event_invite)
        #@attendance  = Event.find(1)
        @attendance.attendees << User.find_by(email: user.email)

        if @attendance.save
          flash.discard(:danger)
          flash[:success] = "Felicidades has invitado a tu amigo !!"
          UserMailer.with(user: @user,eventid: params[:select_list],checkboxs: params[:attendance],emails: check_users_invite).invitation.deliver_now

          # redirect_to invitations_path
        else
          flash[:danger]= "Error mi amigo ID_invite: #{check_ids_invite} ** ID Event:  #{check_event_invite} ** Invitation_sender : #{@user.id}"
        end
      else
        error_arr << "#{User.find_by(email: user.email).name} , "
      end
      if flash[:danger].nil?
        flash[:danger]=error_arr
      end

    end
  end
end
