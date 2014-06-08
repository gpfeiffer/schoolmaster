class AddHoursAndCommentToLoad < ActiveRecord::Migration
  def change
    add_column :loads, :hours, :integer
    add_column :loads, :comment, :text
  end
end
