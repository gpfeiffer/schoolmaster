class AddRankToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :rank, :integer
  end
end
