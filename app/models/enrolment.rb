class Enrolment < ActiveRecord::Base
  attr_accessible :first, :last, :number, :user_id

  belongs_to :user

  validate :first, :last, :number, :presence => true

  def name_number
    "#{first} #{last} (#{number})"
  end
end
