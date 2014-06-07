class AddTimesToLoad < ActiveRecord::Migration
  def change
    add_column :loads, :times, :string
  end
end
