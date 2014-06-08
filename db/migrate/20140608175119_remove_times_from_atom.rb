class RemoveTimesFromAtom < ActiveRecord::Migration
  def up
    remove_column :atoms, :times
  end

  def down
    add_column :atoms, :times, :string
  end
end
