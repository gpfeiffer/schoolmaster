class Student < ActiveRecord::Base
  attr_accessible :completed_on, :cosupervisor, :email, :expected_on, :first, :funder, :home_url, :interests, :last, :location, :photo_url, :programme, :registration, :started_on, :status, :supervisor, :title, :work_phone

  has_many :supervisions, :dependent => :destroy
  has_many :academics, :through => :supervisions
  has_many :committees, :dependent => :destroy

  default_scope :order => [:last, :first]

  def name
    "#{first} #{last}"
  end

  def to_s
    name
  end
end
