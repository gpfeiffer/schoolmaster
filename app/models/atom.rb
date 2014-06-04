class Atom < ActiveRecord::Base
  attr_accessible :code, :description, :discipline, :hours, :semester, :times, :title, :weeks

  default_scope :order => :code

  DISCIPLINES = %w{ Mathematics Applied_Mathematics Statistics Bioinformatics }

  validates :code, :title, :semester, :hours, :presence => true
  validates :discipline, :inclusion => DISCIPLINES

  has_many :loads, :dependent => :destroy
  has_many :academics, :through => :loads

  def to_s
    "#{code} (#{title})"
  end

  def year
    code[2].to_i
  end

  def times_to_table
    rows = %w{ 09 10 11 12 13 14 15 16 17 }
    cols = %w{ Mon Tue Wed Thu Fri }
    table = {}
    rows.each do |row|
      table[row] = {}
      cols.each do |col|
        table[row][col] = ''
      end
    end

    times.split(';').each do |time|
      slot, loc = time.split(":")
      day, hr = slot[0,3], slot[3,2]
      table[hr][day] = loc || '...'
    end

    return { :rows => rows, :cols => cols, :table => table }
  end

end

