class Enrolment < ActiveRecord::Base
  attr_accessible :first, :last, :number, :user_id

  belongs_to :user

  has_many :proposals, :dependent => :destroy

  validates :first, :last, :number, :presence => true

  def name_number
    "#{first} #{last} (#{number})"
  end

  def to_s
    name_number
  end
end
