class Atom < ActiveRecord::Base
  attr_accessible :code, :description, :discipline, :hours, :semester, :times, :title, :weeks

  DISCIPLINES = %w{ Mathematics Applied_Mathematics Statistics Bioinformatics }

  validates :code, :title, :semester, :hours, :presence => true
  validates :discipline, :inclusion => DISCIPLINES

end

