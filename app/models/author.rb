class Author < ActiveRecord::Base
  attr_accessible :email, :first, :last, :programme, :registration

  has_many :projects
end
