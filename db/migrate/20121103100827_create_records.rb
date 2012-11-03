class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :academic_id
      t.integer :broker_id
      t.string :authorid

      t.timestamps
    end
  end
end
