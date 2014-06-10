class RenameYearInLoadToDate < ActiveRecord::Migration
  def up
    rename_column :loads, :year, :date
  end

  def down
    rename_column :loads, :date, :year
  end
end
