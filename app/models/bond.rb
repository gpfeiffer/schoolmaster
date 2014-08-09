class Bond < ActiveRecord::Base
  attr_accessible :atom_id, :molecule_id

  belongs_to :atom
  belongs_to :molecule
end
