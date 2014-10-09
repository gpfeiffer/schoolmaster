class AddRequisitesToMolecule < ActiveRecord::Migration
  def change
    add_column :molecules, :prerequisites, :string
    add_column :molecules, :corequisites, :string
    add_column :molecules, :exrequisites, :string
  end
end
