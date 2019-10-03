class AttendancesController < ApplicationController
  def new
    @attendace = Attendance.new
  end
  def create
    @user = User.find(current_user.id)
    @my= params[:attendance]
    #@attendances = current_user.attendances
    #if @attendance.save
      UserMailer.with(user: @user).invitation.deliver    #Crear attendance_mailer_controller
     # flash[:success] = "Invitations Send Sucessfully !"
      #redirect_to events_path
    #end
  end

end
