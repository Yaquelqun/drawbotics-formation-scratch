class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :name
      t.integer :position
      t.references :course
      t.timestamps
    end

  end
end
