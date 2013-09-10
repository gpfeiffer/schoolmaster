class CreateTeachings < ActiveRecord::Migration
  def change
    create_table :teachings do |t|
      t.integer :year
      t.integer :semester
      t.integer :course_id
      t.integer :academic_id
      t.decimal :hours

      t.timestamps
    end
  end
end
