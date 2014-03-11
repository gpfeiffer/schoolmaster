class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :title
      t.integer :enrolment_id
      t.integer :academic_id

      t.timestamps
    end
  end
end
