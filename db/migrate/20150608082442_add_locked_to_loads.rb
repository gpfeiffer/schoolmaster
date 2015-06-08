class AddLockedToLoads < ActiveRecord::Migration
  def change
    add_column :loads, :locked, :boolean, default: false
  end
end
