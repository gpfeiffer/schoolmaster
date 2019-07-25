class AddMarkToDirection < ActiveRecord::Migration
  def change
    add_column :directions, :mark_a, :integer
    add_column :directions, :mark_b, :integer
    add_column :directions, :mark_c, :integer
    add_column :directions, :mark_d, :integer
    add_column :directions, :mark_e, :integer
    add_column :directions, :mark_f, :integer
  end
end
