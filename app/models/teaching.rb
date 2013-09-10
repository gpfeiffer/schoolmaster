class Teaching < ActiveRecord::Base
  attr_accessible :academic_id, :course_id, :hours, :semester, :year

  belongs_to :academic
  belongs_to :course

  def load
    "#{hours} hours in semester #{semester}"
  end
end
