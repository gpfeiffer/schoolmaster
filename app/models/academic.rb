class Academic < ActiveRecord::Base
  attr_accessible :first, :home_url, :image_url, :last, :title, :work_mail, :work_phone

  has_many :supervisions, :dependent => :destroy
  has_many :students, :through => :supervisions
  has_many :publication_records

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

  def email
    "#{work_mail}@nuigalway.ie"
  end

  def mailto
    "mailto:#{email}"
  end
end
