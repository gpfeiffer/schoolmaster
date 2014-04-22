class Proposal < ActiveRecord::Base
  attr_accessible :academic_id, :accepted, :enrolment_id, :title

  belongs_to :enrolment
  belongs_to :academic

  validates :title, :academic_id, :presence => true

  def title_and_supervisor
    "#{title}: #{academic}"
  end

  def student_and_title
    "#{enrolment.name_number}: #{title}"
  end

  def status
    accepted ? "accepted" : "pending"
  end
end
