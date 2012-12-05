class RemoveSchoolFromAcademic < ActiveRecord::Migration
  def up
    remove_column :academics, :school
  end

  def down
    add_column :academics, :school, :string
  end
end
