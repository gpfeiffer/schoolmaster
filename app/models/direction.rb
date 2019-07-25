# coding: utf-8
class Direction < ActiveRecord::Base
  attr_accessible :academic_id, :comment, :midterm_mark, :open, :presentation_mark, :project_id, :report_mark, :mark_a, :mark_b, :mark_c, :mark_d, :mark_e, :mark_f

  belongs_to :academic
  belongs_to :project

  LABEL = {
    a: "Early and sustained engagement",
    b: "Oral presentation skills",
    c: "Quality of exposition and technical writing",
    d: "Depth and breadth of project",
    e: "Novelty",
    f: "Independent learning and initiative"
  }

  TEXT = {
    a: %(Early and sustained engagement with the project, 
as evidenced by submission of the project proposal, 
and the diligence and commitment shown.),
    b: %(The project concepts are explained clearly and concisely.
The presentation is well-organised and provides a 
comprehensive account of the most important aspects of
the project. Visual/aural/software presentation aids are
clear and comprehensible. Correct and comprehensive
answers are provided to questions.),
    c: %(Organisation of the report. Summary of background and
description of aims. Logical and technical correctness of
mathematical/computational/scientific content. Clarity
of arguments. Use of appropriate notation. Correct and
consistent citation style. Correct use of language,
grammar, spellings and punctuation. Evidence of 
mathematical/scientific/computational literacy.),
    d: %(Conceptual and technical skills demonstrated. Report 
exhibits the student’s accumulated background knowledge
of their field. Range of sources are identified; synthesis
of knowledge from these sources. Used of sophisticated
arguments and technologies.),
    e: %(Aspects of the project go beyond normal course work, for
example, material scoured (and cited!) from published
research or advanced texts / evidence of understanding
of advanced learning and skills.),
    f: %(Evidence of self-directed learning. Demonstration of 
initiative and independence such as in literature search, 
assimilation and application of new concepts, use of software, 
project write up etc. Independent achievement of
short and long-term project goals.),
  }
  
  WEIGHT = {
    a: 10,
    b: 10,
    c: 20,
    d: 20,
    e: 20,
    f: 20,
  }
  
  def total_mark 
    if midterm_mark and presentation_mark and report_mark 
      (midterm_mark + presentation_mark + 8 * report_mark)/10
    end
  end

  def open?
    open
  end

  def closed?
    not open
  end

  def self.current
    Project.current.map(&:direction).uniq
  end

  COLUMNS = %w{ Number Programme First Last Title Mark }

  def to_a
    student = project.author
    row = [ student.registration, student.programme, student.first, student.last, project.title, project.total_mark ]
  end

  def self.to_xls
    date = Date.new(2009)
    book = Spreadsheet::Workbook.new
    sheet = book.create_worksheet :name => 'Projects 2014'
    
    sheet.row(0).concat COLUMNS
    
    format = Spreadsheet::Format.new :color => :blue, :weight => :bold
    sheet.row(0).default_format = format
    
    Direction.current.each_with_index do |direction, i|
      sheet.row(i+1).concat direction.to_a
    end
    
    sio = StringIO.new
    book.write(sio)
    return sio.string
  end

end
