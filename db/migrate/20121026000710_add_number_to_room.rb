class AddNumberToRoom < ActiveRecord::Migration
  def change
    add_column :rooms, :number, :string
  end
end
