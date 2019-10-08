require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  test "namer should be present" do
    @user.name = " "
    assert_not @user.valid?
  end
end
