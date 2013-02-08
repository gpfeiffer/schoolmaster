class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :first
      t.string :last
      t.string :registration
      t.string :programme
      t.string :email

      t.timestamps
    end
  end
end
