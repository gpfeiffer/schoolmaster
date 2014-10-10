class Pathway < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :cohorts

  def to_s
    name
  end
end
