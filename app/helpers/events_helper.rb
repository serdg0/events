module EventsHelper
  def get_users
    @users = User.all
    arr=[]

  @users.each do |user|
    arr << user.email
  end
    return arr
  end

  def add_user_to_event
    @arr=[]
  end


end
