class Direction < ActiveRecord::Base
  attr_accessible :academic_id, :comment, :midterm_mark, :presentation_mark, :project_id, :report_mark

  belongs_to :academic
  belongs_to :project

  def total_mark 
    if midterm_mark and presentation_mark and report_mark 
      (midterm_mark + presentation_mark + 8 * report_mark)/10
    end
  end
end
