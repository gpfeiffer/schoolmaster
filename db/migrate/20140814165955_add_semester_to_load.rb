class AddSemesterToLoad < ActiveRecord::Migration
  def change
    add_column :loads, :semester, :integer
  end
end
