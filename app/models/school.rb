class School < ActiveRecord::Base
  attr_accessible :name

  has_many :academics

  def to_s
    name
  end
end
