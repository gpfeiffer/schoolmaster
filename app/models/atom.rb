class Atom < ActiveRecord::Base
  attr_accessible :code, :description, :discipline, :hours, :semester, :title

  default_scope :order => :code

  DISCIPLINES = %w{ Mathematics Applied_Mathematics Statistics Bioinformatics Other\ ... }

  validates :code, :title, :semester, :hours, :discipline, :presence => true
  validates :code, :uniqueness => true
  validates :discipline, :inclusion => DISCIPLINES

  has_many :loads, :dependent => :destroy
  has_many :academics, :through => :loads

  has_many :bonds, :dependent => :destroy
  has_many :molecules, :through => :bonds

  def to_s
    "#{code}: #{title}"
  end

  def year
    code[2].to_i
  end

  def slots(date)
    loads_by_date = loads.group_by(&:date)[date]
    loads_by_date ? loads_by_date.map(&:slots).sum : []
  end

end

