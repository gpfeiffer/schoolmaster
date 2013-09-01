class AddDisciplineToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :discipline, :string
  end
end
