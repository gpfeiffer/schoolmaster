class Load < ActiveRecord::Base
  attr_accessible :academic_id, :atom_id, :comment, :hours, :times, :weeks, :year

  belongs_to :academic
  belongs_to :atom

  delegate :discipline, :semester, :title, :to => :atom

  def times_module
    times.gsub(/(?<=:)[^;]*/, atom.code)
  end
end
