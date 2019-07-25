class Load < ActiveRecord::Base
  attr_accessible :academic_id, :atom_id, :comment, :date, :hours, :locked, :semester, :times, :weeks

  belongs_to :academic
  belongs_to :atom

  delegate :code, :discipline, :title, :year, :genuine?, :to => :atom

  SEMESTERS = [1, 2]

  validates :semester, :inclusion => SEMESTERS
  validates :times, format: {
    with: /\A((^|;)(Mon|Tue|Wed|Thu|Fri)(09|1[0-9]|20)(:[^;]*)?)*\z/,
    message: "is not properly formatted"
  }

  def locked?
    locked
  end

  def unlocked?
    not locked
  end

  def short
    academic ? academic.short : "N.N."
  end

  def name
    academic ? academic.name : "N.N."
  end

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

  # check a list of slotted loads for clashes
  def self.mark_clashing(slots)
    slots_by_academic = slots.select { |x| x[:load].academic.present? }
                        .group_by { |x| x[:load].academic }
    slots_by_academic.each do |academic, slots|
      if slots.size > 1
        # check weeks
        weeks = Hash.new(0)
        slots.each do |slot|
          Range.new(*slot[:load].weeks.split("-").map(&:to_i)).each do |i|
            weeks[i] += 1
          end
        end
        clashing = weeks.keys.select { |k| weeks[k] > 1 }.sort
        if clashing.size > 1 and clashing = (clashing.first .. clashing.last).to_a
          clashing = (clashing.first .. clashing.last).to_s
        else
          clashing = clashing.join(",")
        end
        slots.each do |slot|
          slot[:clashing] = clashing
        end
      end
    end
  end

  def times_module
    times.gsub(/(?<=:)[^;]*/, atom.code)
  end

  # module-lecturer-venue
  def times_mlv
    times.gsub(/:/, ":#{atom.code} #{academic.short} ")
  end

  # convert load into list of hours per academic
  def account(academics)
    l = academics.map { 0 }
    l[academics.index(academic)] = hours
    return l
  end

  def self.to_xls(loads)
    book = Spreadsheet::Workbook.new
    sheet = book.create_worksheet :name => 'lecture loads'

    academics = loads.map(&:academic).sort.uniq
    atoms = loads.map(&:atom).sort_by(&:code).uniq
    loads_by_atom = loads.group_by(&:atom)

    
    sheet.row(0).concat %w(Code Module)
    sheet.row(0).concat academics.map(&:short)
    
    format = Spreadsheet::Format.new :color => :blue, :weight => :bold
    sheet.row(0).default_format = format

    atoms.each_with_index do |atom, i|
      sheet.row(i+1).concat [atom.code, atom.title]
      accounts = loads_by_atom[atom].map { |x| x.account(academics) }
      accounts = accounts.first.zip(*accounts[1 .. -1]).map(&:sum)
      sheet.row(i+1).concat accounts.map { |x| x if x > 0 }
    end
    
    sio = StringIO.new
    book.write(sio)
    return sio.string
  end

  def csv_row
    [
      code,
      title,
      discipline,
      short,
      date,
      semester,
      slots.map { |slot| "#{slot[:day]}@#{slot[:hr]}" }.join(" "),
      slots.map { |slot| "#{slot[:loc]}" }.join("; "),
      hours,
      weeks,
      comment,
    ]
  end

  def self.to_csv(loads)
    headers = %w{code title discipline name year sem times venues hours weeks comment}
    CSV.generate(headers: true) do |csv|
      csv << headers
      loads.each do |load|
        csv << load.csv_row
      end
    end
  end
end
