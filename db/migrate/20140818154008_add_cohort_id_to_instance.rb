class AddCohortIdToInstance < ActiveRecord::Migration
  def change
    add_column :instances, :cohort_id, :integer
  end
end
