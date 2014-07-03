class AddCodeToInstance < ActiveRecord::Migration
  def change
    add_column :instances, :code, :string
  end
end
