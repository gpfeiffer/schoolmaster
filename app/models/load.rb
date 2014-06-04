class Load < ActiveRecord::Base
  attr_accessible :academic_id, :atom_id, :year

  belongs_to :academic
  belongs_to :atom
end
