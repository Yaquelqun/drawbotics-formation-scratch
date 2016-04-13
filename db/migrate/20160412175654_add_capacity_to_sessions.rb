class AddCapacityToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :capacity, :integer, :default => 15
  end
end
