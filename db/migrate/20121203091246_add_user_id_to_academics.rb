class AddUserIdToAcademics < ActiveRecord::Migration
  def change
    add_column :academics, :user_id, :integer
  end
end
