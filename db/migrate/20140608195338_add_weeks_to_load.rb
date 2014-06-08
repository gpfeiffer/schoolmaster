class AddWeeksToLoad < ActiveRecord::Migration
  def change
    add_column :loads, :weeks, :string
  end
end
