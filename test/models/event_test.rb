# frozen_string_literal: true

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @event = Event.new(title: 'Example User', content: 'user@example.com',
                       start: 'Mon, 30 Sep 2019 22:53:44 UTC +00:00')
  end

  test 'title should be present' do
    @event.title = ' '
    assert_not @event.valid?
  end

  test 'content should be present' do
    @event.content = ' '
    assert_not @event.valid?
  end

  test 'start should be present' do
    @event.start = ' '
    assert_not @event.valid?
  end
end
