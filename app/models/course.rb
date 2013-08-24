class Course < ActiveRecord::Base
  attr_accessible :code, :content, :credits, :description, :examined, :lab_hours, :lecture_hours, :placement_hours, :self_study_hours, :taught, :title, :tutorial_hours
end
