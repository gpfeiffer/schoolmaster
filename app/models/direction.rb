class Direction < ActiveRecord::Base
  attr_accessible :academic_id, :comment, :midterm_mark, :presentation_mark, :project_id, :report_mark

  belongs_to :academic
  belongs_to :project
end
