class AddOutcomesAndResourcesToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :outcomes, :text
    add_column :courses, :resources, :text
  end
end
