# coding: utf-8
class Training < ActiveRecord::Base
  resourcify
  belongs_to :location
  belongs_to :category
  belongs_to :organizer

  has_and_belongs_to_many :trainers

  accepts_nested_attributes_for :organizer

  default_scope {
    order(id: :desc)
  }

  # validates_presence_of :trainers, message: "Nie wybrano trenera!", unless: :studies
  validates_presence_of :organizer, message: "Nie wybrano organizatora!"
  validates_presence_of :category, message: "Nie wybrano kategorii!"
  validates_presence_of :location, message: "Nie wybrano lokalizacji!"
  #validate :has_trainers?

  def has_trainers?
    errors.add(:trainers, 'nie wybrano żadnych trenerów!') if self.trainers.blank? and self.szkolenie?
  end

  #validate :_type_valid, :_category_valid
  
  def szkolenie?
  	!studies  	
  end

  def studia?
  	studies and !postgrad  	
  end

  def podyplomowe?
  	@studies and @postgrad
  end

 #  def _category_valid
 #  	@studies==@category.studies
 #  end

 #  def _type_valid
 #  	(studies and postgrad) or (studies and !postgrad) or not (!studies and postgrad)
 #  	# tudzież (studies && postgrad) || (studies && !postgrad) || !(!studies && postgrad)
 #  	# czyli dopuszczalne nastepujące typy: 
 #  	# *studia podyplomowe
 #  	# *studia normalne
 #  	# *szkolenia
 #  	# nie dopuszczamy innych, szkolenia [czyli nie-studia] podyplomowe będą błędne
 #  	# formularze nie powinny na to pozwolić, ale ktoś może przy nich manipulować, takze tak na wszelki wypadek:)
	# # prawdopodobnie możnaby było się ograniczyć do `!(!studies && postgrad)`
 #  end
end
