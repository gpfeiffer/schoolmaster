class Bond < ActiveRecord::Base
  attr_accessible :atom_id, :molecule_id

  belongs_to :atom, :molecule
end
