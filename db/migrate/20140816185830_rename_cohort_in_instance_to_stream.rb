class RenameCohortInInstanceToStream < ActiveRecord::Migration
  def up
    rename_column :instances, :cohort, :stream
  end

  def down
    rename_column :instances, :stream, :cohort
  end
end
