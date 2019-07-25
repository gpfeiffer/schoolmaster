class Examination < ActiveRecord::Base
  attr_accessible :academic_id, :comment, :open, :presentation_mark, :project_id, :report_mark, :mark_b, :mark_c, :mark_d, :mark_e

  belongs_to :academic
  belongs_to :project

  def open?
    open
  end

  def closed?
    not open
  end
end
