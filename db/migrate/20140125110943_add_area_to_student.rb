class AddAreaToStudent < ActiveRecord::Migration
  def change
    add_column :students, :area, :string
  end
end
