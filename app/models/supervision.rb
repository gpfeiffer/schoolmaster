class Supervision < ActiveRecord::Base
  attr_accessible :academic_id, :status, :student_id, :main

  belongs_to :academic
  belongs_to :student

  validates :academic_id, :student_id, :presence => true
  validates :academic_id, :uniqueness => { :scope => :student_id }

  validate :uniqueness_of_main_supervisor

  protected

  def uniqueness_of_main_supervisor
    if main? and student.supervisions.detect(&:main?)
      errors.add(:main, "supervisor is already selected")
    end
  end

end
