class Cohort < ActiveRecord::Base
  attr_accessible :academic_id, :code, :description, :name, :pathway_id

  belongs_to :academic
  belongs_to :pathway
  has_many :instances, :dependent => :destroy
  has_many :molecules, :through => :instances

  def year
    code[0].to_i
  end

  def to_s
    "#{code} #{name}"
  end
end
