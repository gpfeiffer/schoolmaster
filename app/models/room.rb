class Room < ActiveRecord::Base
  attr_accessible :capacity, :location

  has_many :students

  default_scope :order => :location

  def to_s
    location
  end
end
