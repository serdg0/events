module AttendancesHelper
  def chek_users_invite
    arr=[]
    @my.each do |key,value|
     @v= value
  end
   @v.each do |x|
     if x != ""
       arr << x
     end
   end
  end
end
