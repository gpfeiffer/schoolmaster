class Author < ActiveRecord::Base
  attr_accessible :email, :first, :last, :programme, :registration

  has_many :projects

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

  def to_s
    name
  end

  def mailto
    "mailto:#{email}"
  end
end
