class AddCourseIdToInstance < ActiveRecord::Migration
  def change
    add_column :instances, :course_id, :integer
  end
end
