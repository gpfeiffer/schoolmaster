class Atom < ActiveRecord::Base
  attr_accessible :code, :description, :discipline, :hours, :semester, :times, :title, :weeks
end
