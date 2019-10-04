module EventsHelper
  def get_users
    @users = User.all
    arr=[]
  @users.each do |user|
    arr << user.email
  end
    return arr
  end

  def get_users_name
    @users = User.all
    arr=[]
    @users.each do |user|
      arr << user
    end
    return arr
  end

  def get_events
    @events = Event.where(creator_id: current_user.id)
    arr=[]
    @events.each do |event|
      arr << event
    end
    return arr
  end

  def add_user_to_event
    @arr=[]
  end

  def show_events
    if current_user.events.any?
      render 'shared/show_events'
    else
      "You don't host any event!"
    end
  end
end
