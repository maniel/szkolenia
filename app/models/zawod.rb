class Zawod < ActiveRecord::Base
  resourcify

  belongs_to :organizer
  belongs_to :location
  belongs_to :category

  accepts_nested_attributes_for :organizer

  validates_presence_of :organizer, message: "Nie wybrano organizatora!"  
  validates_presence_of :category, message: "Nie wybrano kategorii!"
  validates_presence_of :location, message: "Nie wybrano lokalizacji!"

  default_scope {
  	order(id: :desc)
  }
end
