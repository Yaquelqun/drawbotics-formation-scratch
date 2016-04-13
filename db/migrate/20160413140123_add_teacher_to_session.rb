class AddTeacherToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :teacher_id, :integer
  end
end
