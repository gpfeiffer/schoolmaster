class Molecule < ActiveRecord::Base
  attr_accessible :code, :course_id, :description, :title
  
  belongs_to :course

  has_many :bonds, :dependent => :destroy
  has_many :atoms, :through => :bonds

  has_many :instances, :dependent => :destroy
  has_many :cohorts, :through => :instances

  default_scope :order => :code

  def to_s
    "#{code}: #{title}"
  end

  def loads
    return [] if atoms.blank?
    atoms.map(&:loads).sum
  end

  def slots(date)
    return [] if atoms.blank?
    atoms.map { |x| x.slots(date) }.sum.each do |slot|
      slot[:code] = code
      slot[:title] = title
      slot[:molecule] = self
    end
  end
end
