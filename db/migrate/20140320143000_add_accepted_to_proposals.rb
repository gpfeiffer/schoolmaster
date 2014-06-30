class AddAcceptedToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :accepted, :boolean
  end
end
