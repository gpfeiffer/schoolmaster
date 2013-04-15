class RemoveStatusFromSupervisions < ActiveRecord::Migration
  def up
    remove_column :supervisions, :status
  end

  def down
    add_column :supervisions, :status, :string
  end
end
