class RemoveSupervisorFromStudents < ActiveRecord::Migration
  def up
    remove_column :students, :supervisor
    remove_column :students, :cosupervisor
  end

  def down
    add_column :students, :cosupervisor, :string
    add_column :students, :supervisor, :string
  end
end
