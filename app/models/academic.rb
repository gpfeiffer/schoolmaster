class Academic < ActiveRecord::Base
  attr_accessible :first, :home_url, :image_url, :last, :school_id, :title, :user_id, :work_mail, :work_phone

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

  default_scope :order => [:last, :first]

  def first_last
    "#{first} #{last}"
  end

  def name
    "#{title} #{first_last}"
  end

  def to_s
    name
  end

  def extension
    if work_phone.blank?
      "... extension ..."
    else
      "x#{work_phone}"
    end
  end

  def email
    "#{work_mail}@nuigalway.ie"
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
end
