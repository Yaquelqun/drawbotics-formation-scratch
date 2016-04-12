class AddDurationToSessions < ActiveRecord::Migration
  def change
    #duration is in minutes
    add_column :sessions, :duration, :integer, :default => 60
  end
end
