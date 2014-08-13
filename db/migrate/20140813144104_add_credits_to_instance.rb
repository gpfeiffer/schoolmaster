class AddCreditsToInstance < ActiveRecord::Migration
  def change
    add_column :instances, :credits, :integer
  end
end
