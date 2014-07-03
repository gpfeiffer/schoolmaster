class Course < ActiveRecord::Base
  attr_accessible :code, :content, :credits, :description, :discipline, :examined, :lab_hours, :lecture_hours, :outcomes, :placement_hours, :resources, :self_study_hours, :taught, :title, :tutorial_hours

  has_many :teachings, :dependent => :destroy
  has_many :academics, :through => :teachings

  has_many :instances, :dependent => :destroy

  default_scope :order => :code

  DISCIPLINES = [
    "Mathematics",
    "Mathematical Studies",
    "Computing",
    "Applied Mathematics",
    "Statistics",
    "Bioinformatics",
    "Engineering",
    "Business",
  ]

  WORKS = %w(lecture tutorial lab self_study placement).map do |x| 
    (x + "_hours").to_sym 
  end

  def workload
    WORKS.sum { |x| send(x) || 0 }
  end

  def workload_text
    WORKS.map { |x| send(x) && "#{send(x)} #{x.to_s.humanize}" }.compact.join(", ")
  end

  def name
    "#{code}: #{title}"
  end

  def to_s
    name
  end
end
