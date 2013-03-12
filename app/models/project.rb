class Project < ActiveRecord::Base
  attr_accessible :author_id, :title, :penalty

  belongs_to :author
  has_one :direction, :dependent => :destroy
  has_one :supervisor, :through => :direction, :source => :academic
  has_many :examinations, :dependent => :destroy
  has_many :examiners, :through => :examinations, :source => :academic

  has_many :bookings

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
    "#{author.a_last}: #{supervisor.short}; #{examiners.map { |x| x.short }.to_sentence}"
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

  # marks.
  WEIGHTS = [0.6, 0.4]

  def midterm_mark
    direction.midterm_mark
  end

  def presentation_mark
    WEIGHTS[0] * direction.presentation_mark + WEIGHTS[1] * examinations.first.presentation_mark if direction.presentation_mark and examinations.first.presentation_mark
  end

  def report_mark
    WEIGHTS[0] * direction.report_mark + WEIGHTS[1] * examinations.first.report_mark if direction.report_mark and examinations.first.report_mark
  end
  
  def total_mark
    if midterm_mark and presentation_mark and report_mark
      (0.1 * midterm_mark + 0.1 * presentation_mark + 0.8 * report_mark).round - penalty
    else
      "%"
    end
  end

  def marked?
    direction.closed? and examinations.first.closed?
  end

end
