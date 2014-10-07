class Instance < ActiveRecord::Base
  attr_accessible :cohort_id, :credits, :date, :molecule_id, :status

  belongs_to :molecule
  belongs_to :cohort

  STATUSES = %w{ C O R }

  delegate :code, :course, :to => :molecule

  validates :status, :inclusion => STATUSES

  def loads
    molecule.loads.group_by(&:date)[date] || []
  end

  def slots
    molecule.slots(date)
  end
end
