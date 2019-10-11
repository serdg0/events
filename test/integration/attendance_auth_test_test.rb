# frozen_string_literal: true

require 'test_helper'

class AttendanceAuthTestTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.new(name: 'Example', email: 'example@user.com')
    @user2 = User.new(name: 'Example1', email: 'example1@user.com')
    @event = @user.events.build(title: 'Example', content: 'Whatever',
                                start: 'Mon, 30 Sep 2019 22:53:44 UTC +00:00')
  end

  test 'only invited users can be attendees' do
    assert_not @event.attendees.include?(@user2)
  end

  test 'invite user to become attendee' do
    @event.attendees << @user2
    assert @event.attendees.include?(@user2)
  end
end
