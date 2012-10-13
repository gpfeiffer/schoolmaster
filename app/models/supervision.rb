class Supervision < ActiveRecord::Base
  attr_accessible :academic_id, :status, :student_id

  belongs_to :academic
  belongs_to :student
end
