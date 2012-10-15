class RenameNameInRoomToLocation < ActiveRecord::Migration
  def up
    rename_column :rooms, :name, :location
  end

  def down
    rename_column :rooms, :location, :name
  end
end
