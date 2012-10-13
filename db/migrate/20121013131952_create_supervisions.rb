class CreateSupervisions < ActiveRecord::Migration
  def change
    create_table :supervisions do |t|
      t.integer :academic_id
      t.integer :student_id
      t.string :status

      t.timestamps
    end
  end
end
