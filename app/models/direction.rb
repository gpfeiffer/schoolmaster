class Direction < ActiveRecord::Base
  attr_accessible :academic_id, :comment, :midterm_mark, :open, :presentation_mark, :project_id, :report_mark

  belongs_to :academic
  belongs_to :project

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
