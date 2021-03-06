class Academic < ActiveRecord::Base
  attr_accessible :first, :home_url, :image_url, :last, :school_id, :short, :title, :user_id, :work_mail, :work_phone

  validates :first, :last, :title, :school_id, :presence => true
  validates :title, :inclusion => TITLES

  belongs_to :user
  belongs_to :school
  has_many :supervisions, :dependent => :destroy
  has_many :students, :through => :supervisions
  has_many :committees, :dependent => :destroy
  has_many :records

  has_many :directions
  has_many :examinations
  has_many :proposals

  has_many :loads, :dependent => :destroy
  has_many :atoms, :through => :loads

  has_many :cohorts

  default_scope :order => [:last, :first]

  def self.academic_year(date = Date.today)
#    date.year + (date.month > 8 ? 1 : 0)
    date.year + (date.month > 6 ? 1 : 0)
  end

  def first_last
    "#{first} #{last}"
  end

  def last_first
    "#{last}, #{first}"
  end

  def name
    "#{title} #{first_last}"
  end

  def a_last
    "#{first[0]}. #{last}"
  end

  def to_s
    first_last
  end

  def extension
    if work_phone.blank?
      "... extension ..."
    else
      "x#{work_phone}"
    end
  end

  def email
    work_mail =~ /@/ ? work_mail : "#{work_mail}@nuigalway.ie"
  end

  def mailto
    "mailto:#{email}"
  end

  def active_supervisions
    supervisions.select { |x| x.student.current? }
  end

  def complete_supervisions
    supervisions.select { |x| x.student.complete? }
  end

  def active_committees
    committees.select { |x| x.student.current? }
  end

  def active_directions
    directions.select { |x| x.project.current? }
  end

  def active_examinations
    examinations.select { |x| x.project.current? }
  end

  # list all projects we are actively either supervising or examining.
  def projects
    active_directions.map(&:project) + active_examinations.map(&:project)
  end

  def slot_ids
    projects.map { |x| x.bookings }.inject(:|).map(&:slot_id)
  end
end
