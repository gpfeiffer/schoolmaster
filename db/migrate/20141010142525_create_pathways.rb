class CreatePathways < ActiveRecord::Migration
  def change
    create_table :pathways do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
