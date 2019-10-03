module AttendancesHelper
  def check_users_invite
    arr=[]
    @checkbox_hash.each do |key,value|
     @mails_array= value
  end
   @mails_array.each do |mail|
     if mail != ""
       arr << mail
     end
   end
  end
end
