class Student < ActiveRecord::Base
  attr_accessible :completed_on, :cosupervisor, :email, :expected_on, :first, :funder, :home_url, :interests, :last, :location, :photo_url, :programme, :registration, :started_on, :status, :supervisor, :title, :work_phone
end
