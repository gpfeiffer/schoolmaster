class AddMarkToExamination < ActiveRecord::Migration
  def change
    add_column :examinations, :mark_b, :integer
    add_column :examinations, :mark_c, :integer
    add_column :examinations, :mark_d, :integer
    add_column :examinations, :mark_e, :integer
  end
end
