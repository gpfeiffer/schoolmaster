class CreateCommittees < ActiveRecord::Migration
  def change
    create_table :committees do |t|
      t.integer :academic_id
      t.integer :student_id

      t.timestamps
    end
  end
end
