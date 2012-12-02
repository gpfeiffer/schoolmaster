class Student < ActiveRecord::Base
  attr_accessible :completed_on, :email, :expected_on, :first, :funder, :home_url, :interests, :last, :photo_url, :programme, :registration, :room_id, :started_on, :status, :title, :work_phone

  has_many :supervisions, :dependent => :destroy
  has_many :academics, :through => :supervisions
  has_many :committees, :dependent => :destroy

  belongs_to :room

  validates :first, :last, :programme, :status, :presence=> true
  validates :status, :inclusion => STATUSES

  default_scope :order => [:last, :first]

  def registration_or_blank
    if registration.blank?
      "... ID ..."
    else
      registration
    end
  end

  def status_or_blank
    if status.blank?
      "... status ..."
    else
      status
    end
  end


  def extension
    if work_phone.blank?
      "... extension ..."
    else
      "x#{work_phone}"
    end
  end

  def current?
    status !~ /[Cc]omplete/
  end

  def name
    "#{first} #{last}"
  end

  def to_s
    name
  end

  def mailto
    "mailto:#{email}"
  end
end
