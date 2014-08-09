class CreateMolecules < ActiveRecord::Migration
  def change
    create_table :molecules do |t|
      t.string :code
      t.string :title
      t.text :description
      t.integer :course_id

      t.timestamps
    end
  end
end
