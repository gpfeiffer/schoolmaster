class AddSchoolIdToAcademic < ActiveRecord::Migration
  def change
    add_column :academics, :school_id, :integer
  end
end
