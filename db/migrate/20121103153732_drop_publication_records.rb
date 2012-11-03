class DropPublicationRecords < ActiveRecord::Migration
  def up
    drop_table :publication_records 
  end

  def down
  end
end
