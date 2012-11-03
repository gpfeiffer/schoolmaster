class Supervision < ActiveRecord::Base
  attr_accessible :academic_id, :status, :student_id

  STATUSES = [
    "Main",
    "Co",
  ]

  belongs_to :academic
  belongs_to :student

  validates :academic_id, :student_id, :status, :presence => true
  validates :status, :inclusion => STATUSES

end
