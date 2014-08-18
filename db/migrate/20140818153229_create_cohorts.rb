class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.string :code
      t.string :name
      t.text :description
      t.integer :academic_id

      t.timestamps
    end
  end
end
