class AddSchoolToAcademics < ActiveRecord::Migration
  def change
    add_column :academics, :school, :string
  end
end
