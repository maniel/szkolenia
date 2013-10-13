# coding: utf-8
class Organizer < ActiveRecord::Base
	has_many :trainings, :dependent => :restrict_with_exception
	validates_presence_of :name, message: "Organizator nie ma nazwy!"
end
