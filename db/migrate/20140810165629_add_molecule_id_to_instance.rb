class AddMoleculeIdToInstance < ActiveRecord::Migration
  def change
    add_column :instances, :molecule_id, :integer
  end
end
