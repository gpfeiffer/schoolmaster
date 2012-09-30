class CreateAcademics < ActiveRecord::Migration
  def change
    create_table :academics do |t|
      t.string :title
      t.string :first
      t.string :last
      t.string :work_phone
      t.string :work_mail
      t.string :home_url
      t.string :image_url

      t.timestamps
    end
  end
end
