class Project < ActiveRecord::Base
  attr_accessible :author_id, :title

  belongs_to :author
  has_one :direction, :dependent => :destroy
  has_one :supervisor, :through => :direction, :source => :academic
  has_many :examinations, :dependent => :destroy
  has_many :examiners, :through => :examinations, :source => :academic

  has_many :bookings

  def supervisor_id
    supervisor.id if supervisor
  end

  def title_or_blank
    if title.blank?
      "... title ..."
    else
      title
    end
  end

end
