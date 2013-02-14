module VenuesHelper
  def academic_year
    year = Time.now.year
    "%d/%0#2d" %[year - 1, year % 100]
  end
end
