class AddShortToAcademics < ActiveRecord::Migration
  def change
    add_column :academics, :short, :string
  end
end
