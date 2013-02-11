class Booking < ActiveRecord::Base
  attr_accessible :project_id, :slot_id, :venue_id

  belongs_to :project
  belongs_to :slot
  belongs_to :venue

  validates :project_id, :slot_id, :venue_id, :presence => true
  validates_uniqueness_of :slot_id, :scope => [:venue_id]

  def to_s
    "#{slot}: #{venue}"
  end
end
