class Academic < ActiveRecord::Base
  attr_accessible :first, :home_url, :image_url, :last, :title, :work_mail, :work_phone

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
