class Room < ActiveRecord::Base
  attr_accessible :capacity, :location, :number

  has_many :students

  validates :location, :presence => true

  default_scope :order => [:location, :number]

  def to_s
    "#{number}, #{location}"
  end
end
