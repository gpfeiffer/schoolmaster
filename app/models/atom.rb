class Atom < ActiveRecord::Base
  attr_accessible :code, :description, :discipline, :hours, :semester, :times, :title, :weeks

  default_scope :order => :code

  DISCIPLINES = %w{ Mathematics Applied_Mathematics Statistics Bioinformatics }

  validates :code, :title, :semester, :hours, :discipline, :presence => true
  validates :code, :uniqueness => true
  validates :discipline, :inclusion => DISCIPLINES

  has_many :loads, :dependent => :destroy
  has_many :academics, :through => :loads

  def to_s
    "#{code} (#{title})"
  end

  def year
    code[2].to_i
  end

end

