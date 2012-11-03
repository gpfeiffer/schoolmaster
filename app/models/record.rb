class Record < ActiveRecord::Base
  attr_accessible :academic_id, :authorid, :broker_id

  belongs_to :academic
  belongs_to :broker

  validates :academic_id, :broker_id, :authorid, :presence => true
end
