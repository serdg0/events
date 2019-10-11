# frozen_string_literal: true

require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @event = Event.new(title: 'Example', content: 'whatever',
                       start: 'Mon, 30 Sep 2019 22:53:44 UTC +00:00')
    @user = User.create(name: 'Example User', email: 'user@example.com')
  end

  test 'Fail to create event without a creator' do
    assert_not @event.save
  end

  test 'Succeed to create event when building with a creator' do
    @event.creator_id = @user.id
    assert @event.save
  end
end
