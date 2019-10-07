module AttendancesHelper
  def check_users_invite
    arr=[]
    if @checkbox_hash.nil?
           @checkbox_hash={}
    else
      @checkbox_hash.each do |key,value|
        @mails_array= value
      end
    end
    @mails_array=[] if @mails_array.nil?
   @mails_array.each do |mail|
     if mail != ""
       arr << mail
     end
   end
  end

  def check_ids_invite
    arr=[]
    if @checkbox_hash.nil?
      @checkbox_hash={}
    else
      @checkbox_hash.each do |key,value|
        @ids_array= value
      end
    end
    @ids_array=[] if @ids_array.nil?
    @ids_array.each do |id|
      if id != ''
        arr << id
      end
    end
    arrid=[]
    puts "Yo soy el uts fallando #{arr}"
    arr.each do |email|

      u = User.find_by(email: email )
      arrid << u.email
    end
    arrid
  end

  def check_event_invite
    @select_hash
  end
  def check_event_selected
    id =  @select_hash
    event=Event.find(id)
    return event
  end
end