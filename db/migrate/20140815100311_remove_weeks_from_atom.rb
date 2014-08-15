class RemoveWeeksFromAtom < ActiveRecord::Migration
  def up
    remove_column :atoms, :weeks
  end

  def down
    add_column :atoms, :weeks, :string
  end
end
