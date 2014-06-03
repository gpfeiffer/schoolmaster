class CreateAtoms < ActiveRecord::Migration
  def change
    create_table :atoms do |t|
      t.string :code
      t.string :title
      t.text :description
      t.integer :hours
      t.string :weeks
      t.integer :semester
      t.string :times
      t.string :discipline

      t.timestamps
    end
  end
end
