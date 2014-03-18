class Proposal < ActiveRecord::Base
  attr_accessible :academic_id, :enrolment_id, :title

  belongs_to :enrolment
  belongs_to :academic

  validates :title, :academic_id, :presence => true

  def title_and_supervisor
    "#{title}: #{academic}"
  end
end