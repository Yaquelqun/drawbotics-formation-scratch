class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :location
      t.datetime :date
      t.integer :position

      t.references :chapter
      t.timestamps 
    end
  end
end
