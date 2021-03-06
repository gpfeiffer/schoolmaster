class Project < ActiveRecord::Base
  attr_accessible :author_id, :penalty, :title, :year

  belongs_to :author
  has_one :direction, :dependent => :destroy
  has_one :supervisor, :through => :direction, :source => :academic
  has_many :examinations, :dependent => :destroy
  has_many :examiners, :through => :examinations, :source => :academic
  has_many :bookings, :dependent => :destroy

  validate :year, :presence => true

  def supervisor_id
    supervisor.id if supervisor
  end

  def title_or_blank
    if title.blank?
      "... title ..."
    else
      title
    end
  end

  def short
    "#{author.a_last}: #{supervisor.short}; #{examiners.map(&:short).to_sentence}"
  end

  # list all academics involved in assessing this project
  def academics
    [supervisor] + examiners
  end

  # a project is critical, if it has exactly one examiner, 
  # and their report mark differs by more that 15 from the supervisor's.
  def critical?
    examiners.count == 1 and direction.report_mark and 
      examinations.first.report_mark and 
      (direction.report_mark - examinations.first.report_mark).abs > 10
  end
 
  # new marking scheme, overrides the one below.
  def marks
    s = direction
    e = examinations.first
    all = { s: { a: (s.mark_a or 0),
                 b: (s.mark_b or 0),
                 c: (s.mark_c or 0),
                 d: (s.mark_d or 0),
                 e: (s.mark_e or 0),
                 f: (s.mark_f or 0)
               } }
    if e
      all[:e] = { b: (e.mark_b or 0),
                  c: (e.mark_c or 0),
                  d: (e.mark_d or 0),
                  e: (e.mark_e or 0)
                }
    else
      all[:e] = { b: 0, c: 0, d: 0, e: 0 }
    end
    all
  end

  def discordance
    m = marks
    (m[:s].slice(:b, :c, :d, :e).values.sum - m[:e].values.sum).abs
  end
  
  def critical?
    discordance > 10
  end
    
  def total
    m = marks
    m[:s][:a] + m[:s][:f] + (m[:s].slice(:b, :c, :d, :e).values.sum + m[:e].values.sum) / 2
  end
  
  # marks.
  WEIGHTS = [0.6, 0.4]

  def midterm_mark
    direction.midterm_mark
  end

  def presentation_mark
    WEIGHTS[0] * direction.presentation_mark + WEIGHTS[1] * examinations.first.presentation_mark if direction.presentation_mark and examinations.first and examinations.first.presentation_mark
  end

  def report_mark
    WEIGHTS[0] * direction.report_mark + WEIGHTS[1] * examinations.first.report_mark if direction.report_mark and examinations.first and examinations.first.report_mark
  end
  
  def total_mark
    if midterm_mark and presentation_mark and report_mark
      (0.1 * midterm_mark + 0.1 * presentation_mark + 0.8 * report_mark).round - penalty
    else
      "%"
    end
  end

  def marked?
    direction.closed? and examinations.first and examinations.first.closed?
  end

  def self.academic_year(date = Date.today)
    date.year + (date.month > 8 ? 1 : 0)
  end

  def current?
    year == Project.academic_year
  end

  def self.current
    year = academic_year
    Project.where(:year => year)
  end
end
