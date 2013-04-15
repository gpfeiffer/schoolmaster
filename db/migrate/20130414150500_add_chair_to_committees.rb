class AddChairToCommittees < ActiveRecord::Migration
  def change
    add_column :committees, :chair, :boolean
  end
end
