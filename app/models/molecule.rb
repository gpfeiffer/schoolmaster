class Molecule < ActiveRecord::Base
  attr_accessible :code, :course_id, :description, :title
  
  belongs_to :course

  has_many :bonds, :dependent => :destroy
  has_many :atoms, :through => :bonds

  has_many :instances, :dependent => :destroy

  def to_s
    "#{code}: #{title}"
  end

  def loads
    atoms.map(&:loads).sum
  end

  def slots(date)
    atoms.map { |x| x.slots(date) }.sum.each do |slot|
      slot[:code] = code
    end
  end
end
