class AddPathwayIdToCohort < ActiveRecord::Migration
  def change
    add_column :cohorts, :pathway_id, :integer
  end
end
