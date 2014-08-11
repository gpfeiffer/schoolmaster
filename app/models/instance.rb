class Instance < ActiveRecord::Base
  attr_accessible :cohort, :date, :molecule_id, :status

  belongs_to :molecule

  COHORTS = %w{ 1BME1 2BME1 3BME1 4BME1 1BMS1 2BMS1 3BMS2 4BMS2 1BS1 1FM1 2FM1 3FM2 4FM2 }
  STATUSES = %w{ C O }

  delegate :code, :course, :to => :molecule

  def loads
    molecule.loads.group_by(&:date)[date] || []
  end

  def slots
    molecule.slots(date)
  end
end
