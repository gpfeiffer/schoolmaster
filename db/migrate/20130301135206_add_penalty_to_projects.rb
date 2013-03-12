class AddPenaltyToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :penalty, :integer, :null => false, :default => 0
  end
end
