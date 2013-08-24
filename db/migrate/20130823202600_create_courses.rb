class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.string :code
      t.integer :credits
      t.string :taught
      t.string :examined
      t.integer :lecture_hours
      t.integer :tutorial_hours
      t.integer :lab_hours
      t.integer :self_study_hours
      t.integer :placement_hours
      t.text :content

      t.timestamps
    end
  end
end
