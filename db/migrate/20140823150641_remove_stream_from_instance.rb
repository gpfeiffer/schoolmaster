class RemoveStreamFromInstance < ActiveRecord::Migration
  def up
    remove_column :instances, :stream
  end

  def down
    add_column :instances, :stream, :string
  end
end
