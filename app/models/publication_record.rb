class PublicationRecord < ActiveRecord::Base
  attr_accessible :academic_id, :authorid, :resource

  belongs_to :academic

  def url
    "#{resource}#{authorid}"
  end
end
