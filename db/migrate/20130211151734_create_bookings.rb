class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :project_id
      t.integer :slot_id
      t.integer :venue_id

      t.timestamps
    end
  end
end
