class Project < ActiveRecord::Base
  attr_accessible :author_id, :title

  belongs_to :author
end
