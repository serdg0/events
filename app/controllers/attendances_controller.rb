class AttendancesController < ApplicationController
  def new
    @attendace = Attendance.new
  end
  def create
    @user = User.find_by(params[:user][:email])
    #@attendances = current_user.attendances
    #if @attendance.save
      UserMailer.with(user: @user).invitation.deliver_later   #Crear attendance_mailer_controller
     # flash[:success] = "Invitations Send Sucessfully !"
      #redirect_to events_path
    #end
  end

end
