class CreateLoads < ActiveRecord::Migration
  def change
    create_table :loads do |t|
      t.integer :academic_id
      t.integer :atom_id
      t.integer :year

      t.timestamps
    end
  end
end
