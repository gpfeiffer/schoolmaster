class Booking < ActiveRecord::Base
  attr_accessible :project_id, :slot_id, :venue_id

  belongs_to :project
  belongs_to :slot
  belongs_to :venue

  validates :project_id, :slot_id, :venue_id, :presence => true
  validates_uniqueness_of :slot_id, :scope => [:venue_id]

  validate :academics_available

  def to_s
    "#{slot}: #{venue}"
  end

  private

  def academics_available
    project.academics.each do |academic|
      if academic.slot_ids.include? slot_id
        errors.add(:examiner, "#{academic.short} is not available for this time slot")
      end
    end
  end
end
