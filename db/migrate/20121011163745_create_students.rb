class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first
      t.string :last
      t.string :registration
      t.string :location
      t.string :photo_url
      t.text :interests
      t.string :programme
      t.string :email
      t.string :home_url
      t.string :work_phone
      t.string :title
      t.string :funder
      t.string :supervisor
      t.string :cosupervisor
      t.string :status
      t.date :started_on
      t.date :expected_on
      t.date :completed_on

      t.timestamps
    end
  end
end
