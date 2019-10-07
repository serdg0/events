module EventsHelper
  def get_users
    User.pluck(:email)
  end

  def get_users_name
    User.pluck(:name)
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

  def past_events
    if current_user.attended_event.past.any?
      render 'shared/past_events'
    else
      "You were never invited to an event."
    end
  end

  def upcoming_events
    if current_user.attended_event.upcoming.any?
      render 'shared/upcoming_events'
    else
      "You don't have upcoming events."
    end
  end
end

