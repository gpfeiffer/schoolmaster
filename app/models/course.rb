class Course < ActiveRecord::Base
  attr_accessible :code, :content, :credits, :description, :examined, :lab_hours, :lecture_hours, :placement_hours, :self_study_hours, :taught, :title, :tutorial_hours

  WORKS = %w(lecture tutorial lab self_study placement).map do |x| 
    (x + "_hours").to_sym 
  end

  def workload
    WORKS.sum { |x| send(x) || 0 }
  end

  def workload_text
    WORKS.map { |x| send(x) && "#{send(x)} #{x.to_s.humanize}" }.compact.join(", ")
  end

end
