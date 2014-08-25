class Cohort < ActiveRecord::Base
  attr_accessible :academic_id, :code, :description, :name

  belongs_to :academic
  has_many :instances, :dependent => :destroy
  has_many :molecules, :through => :instances

  def to_s
    "#{code} #{name}"
  end
end
