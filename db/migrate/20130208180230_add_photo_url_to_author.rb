class AddPhotoUrlToAuthor < ActiveRecord::Migration
  def change
    add_column :authors, :photo_url, :string
  end
end
