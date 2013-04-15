class AddMainToSupervisions < ActiveRecord::Migration
  def change
    add_column :supervisions, :main, :boolean, :null => false, :default => true
  end
end
