class Booking < ActiveRecord::Base
  attr_accessible :project_id, :slot_id, :venue_id

  belongs_to :project
  belongs_to :slot
  belongs_to :venue

  def to_s
    "#{slot}: #{venue}"
  end
end
