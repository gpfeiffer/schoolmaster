class Committee < ActiveRecord::Base
  attr_accessible :academic_id, :student_id

  belongs_to :academic
  belongs_to :student
end