class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.string :time

      t.timestamps
    end
  end
end
