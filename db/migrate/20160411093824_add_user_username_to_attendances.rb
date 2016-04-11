class AddUserUsernameToAttendances < ActiveRecord::Migration
  def change
    add_column :attendances, :user_username, :string
  end
end
