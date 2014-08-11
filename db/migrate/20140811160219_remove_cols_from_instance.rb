class RemoveColsFromInstance < ActiveRecord::Migration
  def up
    remove_column :instances, :atom_id
    remove_column :instances, :course_id
    remove_column :instances, :code
  end

  def down
    add_column :instances, :code, :string
    add_column :instances, :course_id, :integer
    add_column :instances, :atom_id, :integer
  end
end
