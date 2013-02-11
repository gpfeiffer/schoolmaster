class Slot < ActiveRecord::Base
  attr_accessible :time

  def to_s
    time
  end
end
