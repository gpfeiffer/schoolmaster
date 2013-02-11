class AddOpenToExamination < ActiveRecord::Migration
  def change
    add_column :examinations, :open, :boolean
  end
end
