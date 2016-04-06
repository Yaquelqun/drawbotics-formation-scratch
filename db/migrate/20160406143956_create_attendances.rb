class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.boolean :success

      t.references :session
      t.references :user
    end
  end
end
