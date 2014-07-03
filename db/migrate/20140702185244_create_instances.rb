class CreateInstances < ActiveRecord::Migration
  def change
    create_table :instances do |t|
      t.string :cohort
      t.integer :credits
      t.integer :atom_id
      t.string :code
      t.string :status

      t.timestamps
    end
  end
end
