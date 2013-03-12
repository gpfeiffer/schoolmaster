class Examination < ActiveRecord::Base
  attr_accessible :academic_id, :comment, :open, :presentation_mark, :project_id, :report_mark

  belongs_to :academic
  belongs_to :project

  def open?
    open
  end

  def closed?
    not open
  end
end
