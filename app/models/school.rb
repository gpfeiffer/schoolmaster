class School < ActiveRecord::Base
  attr_accessible :name, :rank

  has_many :academics

  default_scope :order => :rank

  def to_s
    name
  end
end
