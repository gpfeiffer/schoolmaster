class Broker < ActiveRecord::Base
  attr_accessible :name, :template

  has_many :records

  validates :name, :template, :presence => true
end
