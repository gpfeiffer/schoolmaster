module LoadsHelper

  # how to turn a string of DayHr:Loc's into a time-table
  def  times_table_for(times)
    rows = %w{ 09 10 11 12 13 14 15 16 17 }
    cols = %w{ Mon Tue Wed Thu Fri }
    table = {}
    rows .each do |row|
      table[row] = {}
      cols.each do |col|
        table[row][col] = ""
      end
    end

    times.split(';').each do |time|
      if time.present?
        slot, loc = time.split(":")
        day, hr = slot[0,3], slot[3,2]
        table[hr][day] += loc || '...'
      end
    end

    content_tag(:table, :class => "times") do
      content_tag(:tr) do
        content_tag(:th, "", :class => "times") +
        cols.map do |col| 
          content_tag(:th, col, :class => "times")
        end.sum
      end +
      rows.map do |row|
        content_tag(:tr) do
          content_tag(:th, row + ":00", :class => "times") +
          cols.map do |col|
            if table[row][col] != ""
              content_tag(:td, table[row][col], :class => "times", :bgcolor => "lightgreen")
            else
              content_tag(:td, '', :class => "times")
            end
          end.sum
        end
      end.sum
    end
  end

  # how to turn a year into an academic year
  def academic_year_code(year)
    year = year.to_i
    "%d/%0#2d" %[year - 1, year % 100]
  end

end
