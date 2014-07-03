class RemoveCreditsAndCodeFromInstance < ActiveRecord::Migration
  def up
    remove_column :instances, :credits
    remove_column :instances, :code
  end

  def down
    add_column :instances, :code, :string
    add_column :instances, :credits, :integer
  end
end
