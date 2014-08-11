class AddDateToInstance < ActiveRecord::Migration
  def change
    add_column :instances, :date, :integer
  end
end
