class Organizer < ActiveRecord::Base
	has_many :trainings, :dependent => :restrict_with_exception
end
