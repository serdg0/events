module EventsHelper
  def get_users
    @users = User.all
    arr=[]

  @users.each do |user|
    arr << user.name
  end
    return arr
  end

  def fill_attendance

  end
end
