class AddOpenToDirection < ActiveRecord::Migration
  def change
    add_column :directions, :open, :boolean
  end
end
