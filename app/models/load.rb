class Load < ActiveRecord::Base
  attr_accessible :academic_id, :atom_id, :comment, :date, :hours, :times, :weeks

  belongs_to :academic
  belongs_to :atom

  delegate :code, :discipline, :semester, :title, :to => :atom

  def times_module
    times.gsub(/(?<=:)[^;]*/, atom.code)
  end
end
