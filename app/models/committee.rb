class Committee < ActiveRecord::Base
  attr_accessible :academic_id, :student_id, :chair

  belongs_to :academic
  belongs_to :student

  validates :academic_id, :student_id, :presence => true
  validates :academic_id, :uniqueness => { :scope => :student_id }

  validate :uniqueness_of_committee_chair

  protected

  def uniqueness_of_committee_chair
    if chair? and student.committees.detect(&:chair?)
      errors.add(:chair, "of this committee is already selected")
    end
  end

end
