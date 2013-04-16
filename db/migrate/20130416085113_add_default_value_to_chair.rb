class AddDefaultValueToChair < ActiveRecord::Migration
  def up
    change_column :committees, :chair, :boolean, :null => false, :default => false
  end
  
  def down
    change_column :committees, :chair, :boolean, :null => nil, :default => nil
  end
end
