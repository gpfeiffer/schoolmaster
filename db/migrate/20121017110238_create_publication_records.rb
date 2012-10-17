class CreatePublicationRecords < ActiveRecord::Migration
  def change
    create_table :publication_records do |t|
      t.string :resource
      t.string :authorid
      t.integer :academic_id

      t.timestamps
    end
  end
end
