class Organizer < ActiveRecord::Base
	has_many :trainings, :dependent => :restrict
end
