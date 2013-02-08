class Examination < ActiveRecord::Base
  attr_accessible :academic_id, :comment, :presentation_mark, :project_id, :report_mark

  belongs_to :academic
  belongs_to :project
end
