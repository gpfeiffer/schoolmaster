class Cohort < ActiveRecord::Base
  attr_accessible :academic_id, :code, :description, :name, :pathway_id

  belongs_to :academic
  belongs_to :pathway
  has_many :instances, :dependent => :destroy
  has_many :molecules, :through => :instances

  # the year is encoded as the first letter of code
  def year
    code[0].to_i
  end

  # stream or pathway
  def type
    /(?<=\d)[A-Z]{2,5}/.match(code) ? "Programmes" : "Pathways"
  end

  # the stream is the sequence of capital letters after the year
  def stream
    m = /(?<=\d)[A-Z]{2,5}/.match(code)
    m ? m[0] : name
  end

  def to_s
    "#{code} - #{name}"
  end
end
