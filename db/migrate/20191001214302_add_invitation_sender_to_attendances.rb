class AddInvitationSenderToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :invitation_sender, :integer
  end
end
