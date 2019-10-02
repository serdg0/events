class AttendancesController < ApplicationController
  def create
    @attendances = current_user.attendances
    #if @attendance.save
      #UserMailer.with(user: @user).account_activation.deliver_later   #Crear attendance_mailer_controller
     # flash[:success] = "Invitations Send Sucessfully !"
      #redirect_to events_path
    #end
  end

  def index
  end
end
