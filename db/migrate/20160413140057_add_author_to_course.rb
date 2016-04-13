class AddAuthorToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :author_id, :integer
  end
end
