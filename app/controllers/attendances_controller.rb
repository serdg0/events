class AttendancesController < ApplicationController
  def new
    @attendace = Attendance.new
  end
  def create
    @user = User.find(current_user.id)
    @checkbox_hash= params[:attendance]
    #@attendances = current_user.attendances
    #if @attendance.save
    check_users_invite.each do |email|
      UserMailer.with(email).invitation.deliver_now
    end

    #Crear attendance_mailer_controller
     # flash[:success] = "Invitations Send Sucessfully !"
      #redirect_to events_path
    #end
  end

end
