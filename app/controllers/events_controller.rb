class EventsController < ApplicationController

  def index
    @event = Event.find(params[:e_id])
  end

  def dashboard
    @users = User.all
    @events = Event.all
  end

  def new
    @user = current_user
    @event = Event.new
    @attendance = Attendance.new
  end

  def create
    @user = current_user
    #@attendance = current_user.id
    @event = @user.events.new(event_params)
    if @event.save && current_user
      flash[:success] = "Event created!"
      redirect_to event_path
    else
      flash.now[:danger] = 'Not a valid event'
      render 'new'
    end
  end

  def show
    @event = current_user.events
  end

  def friends
    @user = current_user
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :start, :end,
                                  :location, :creator_id)
  end

  def attendance_params
    params.require(:attendance).permit(:user_id,:event_id,:invitation_sender)
  end
end
