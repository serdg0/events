# frozen_string_literal: true

module EventsHelper
  def retrieve_users
    @users = User.all
    arr = []
    @users.each do |user|
      arr << user.email
    end
    arr
  end

  def retrieve_users_name
    @users = User.all
    arr = []
    @users.each do |user|
      arr << user
    end
    arr
  end

  def retrieve_events
    @events = Event.where(creator_id: current_user.id)
    arr = []
    @events.each do |event|
      arr << event
    end
    arr
  end

  def add_user_to_event
    @arr = []
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
      'You were never invited to an event.'
    end
  end

  def upcoming_events
    if current_user.attended_event.upcoming.any?
      render 'shared/upcoming_events'
    else
      "You don't have upcoming events."
    end
  end

  def invited?(user)
    !attendees.where(id: user.id).empty?
  end
end
