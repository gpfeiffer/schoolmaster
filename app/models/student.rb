class Student < ActiveRecord::Base
  attr_accessible :area, :code, :completed_on, :email, :expected_on, :first, :funder, :home_url, :interests, :last, :photo_url, :programme, :registration, :room_id, :started_on, :status, :title, :viva_date, :work_phone

  has_many :supervisions, :dependent => :destroy
  has_many :academics, :through => :supervisions
  has_many :committees, :dependent => :destroy
  has_many :members, :through => :committees, :source => :academic

  belongs_to :room

  validates :first, :last, :programme, :status, :presence=> true
  validates :status, :inclusion => STATUSES
  validates :area, :inclusion => AREAS

  default_scope :order => [:last, :first]

  def supervisors  # main supervisor is first in list.
    supervisions.sort_by { |x| { true => 0, false => 1 }[x.main] }.map(&:academic)
  end

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

  def complete?
    status == "Completed"
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

  def committee_chair
    committee = committees.detect(&:chair?)
    committee and committee.academic
  end

  COLUMNS = %w{ Name Institute Degree Start Funding Area Interests }

  def to_a
      row = [ name, "NUIG", programme, started_on, funder, area, interests ]
  end

  def self.to_xls
    date = Date.new(2009)
    book = Spreadsheet::Workbook.new
    sheet = book.create_worksheet :name => 'student_funds'
    
    sheet.row(0).concat COLUMNS
    
    format = Spreadsheet::Format.new :color => :blue, :weight => :bold
    sheet.row(0).default_format = format
    
    Student.select { |s| s.started_on and s.started_on >= date }.each_with_index do |student, i|
      sheet.row(i+1).concat student.to_a
    end
    
    sio = StringIO.new
    book.write(sio)
    return sio.string
  end

end
