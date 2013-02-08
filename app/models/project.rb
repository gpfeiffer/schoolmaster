class Project < ActiveRecord::Base
  attr_accessible :author_id, :title

  belongs_to :author
  has_one :direction
  has_one :supervisor, :through => :direction, :source => :academic
  has_many :examinations
end
