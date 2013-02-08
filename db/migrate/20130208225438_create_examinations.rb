class CreateExaminations < ActiveRecord::Migration
  def change
    create_table :examinations do |t|
      t.integer :project_id
      t.integer :academic_id
      t.text :comment
      t.integer :presentation_mark
      t.integer :report_mark

      t.timestamps
    end
  end
end
