class RemoveLocationFromStudents < ActiveRecord::Migration
  def up
    remove_column :students, :location
  end

  def down
    add_column :students, :location, :string
  end
end
