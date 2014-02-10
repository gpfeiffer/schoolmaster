class Author < ActiveRecord::Base
  attr_accessible :email, :first, :last, :programme, :registration, :photo_url

  has_many :projects, :dependent => :destroy

  default_scope :order => [:last, :first]

  def registration_or_blank
    if registration.blank?
      "... ID ..."
    else
      registration
    end
  end

  def name
    "#{first} #{last}"
  end

  def last_first
    "#{last}, #{first}"
  end

  def a_last
    "#{first[0]}. #{last}"
  end

  def to_s
    name
  end

  def mailto
    "mailto:#{email}"
  end

  def self.current
    Project.current.map(&:author).uniq
  end
end
