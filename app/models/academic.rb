class Academic < ActiveRecord::Base
  attr_accessible :first, :home_url, :image_url, :last, :title, :work_mail, :work_phone

  def name
    "#{title} #{first} #{last}"
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
