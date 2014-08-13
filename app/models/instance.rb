class Instance < ActiveRecord::Base
  attr_accessible :cohort, :credits, :date, :molecule_id, :status

  belongs_to :molecule

  COHORTS = %w{ 
    1BMS1 2BMS1 3BMS2 4BMS2 
    1BS1 2BS1 3BS9 4BS3 
    1FM1 2FM1 3FM2 4FM2
    1BME1 2BME1 3BME1 4BME1 
    1BA1 2BA1-MA2030 2BA1-MH2030 3BA1-MA3030 3BA1-MH3030
    1BCx 2BCx
    1BCT1 2BCT1 3BCT1 4BCT1 
    1Eng 2Eng
    1BY1 
    1BCM1 
    CS201 CS322
  }
  STATUSES = %w{ C O }

  delegate :code, :course, :to => :molecule

  validates :cohort, :inclusion => COHORTS
  validates :status, :inclusion => STATUSES

  def loads
    molecule.loads.group_by(&:date)[date] || []
  end

  def slots
    molecule.slots(date)
  end
end
