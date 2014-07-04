class Instance < ActiveRecord::Base
  attr_accessible :atom_id, :code, :cohort, :course_id, :status

  belongs_to :atom
  belongs_to :course

  COHORTS = %w{ 1BMS1 1BS1 2BMS1 }
  STATUSES = %w{ C O }
end
