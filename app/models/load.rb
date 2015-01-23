class Load < ActiveRecord::Base
  attr_accessible :academic_id, :atom_id, :comment, :date, :hours, :semester, :times, :weeks

  belongs_to :academic
  belongs_to :atom

  delegate :code, :discipline, :title, :year, :to => :atom

  SEMESTERS = [1, 2]

  validates :semester, :inclusion => SEMESTERS
  validates :times, format: {
    with: /\A((^|;)(Mon|Tue|Wed|Thu|Fri)(09|1[0-7])(:[^;]*)?)*\z/,
    message: "is not properly formatted"
  }


  def slots
    times.split(";").map do |time|
      slot, loc = time.split(":")
      {
        :load => self,
        :day => slot[0,3],
        :hr => slot[3,2],
        :loc => loc || '...'
      }
    end
  end

  def times_module
    times.gsub(/(?<=:)[^;]*/, atom.code)
  end

  # module-lecturer-venue
  def times_mlv
    times.gsub(/:/, ":#{atom.code} #{academic.short} ")
  end
end
