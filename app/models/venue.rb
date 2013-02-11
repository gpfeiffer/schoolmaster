class Venue < ActiveRecord::Base
  attr_accessible :location

  def to_s
    location
  end
end
