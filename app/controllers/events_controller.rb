class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @user = current_user
    @event = Event.new
  end

  def create
    @user = current_user
    @event = @user.events.new(event_params)
    if @event.save && current_user
      flash[:success] = "Event created!"
      redirect_to @event
    else
      flash.now[:danger] = 'Not a valid event'
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :start, :end,
                                  :location, :creator_id)
  end
end
