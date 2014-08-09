class CreateBonds < ActiveRecord::Migration
  def change
    create_table :bonds do |t|
      t.integer :atom_id
      t.integer :molecule_id

      t.timestamps
    end
  end
end
