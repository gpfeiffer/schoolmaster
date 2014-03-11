class CreateEnrolments < ActiveRecord::Migration
  def change
    create_table :enrolments do |t|
      t.string :first
      t.string :last
      t.string :number
      t.integer :user_id

      t.timestamps
    end
  end
end
