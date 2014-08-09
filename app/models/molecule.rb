class Molecule < ActiveRecord::Base
  attr_accessible :code, :course_id, :description, :title
  
  belongs_to :course

  has_many :bonds, :dependent => :destroy
  has_many :atoms, :through => :bonds
end
