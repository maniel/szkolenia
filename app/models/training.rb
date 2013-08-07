# coding: utf-8
class Training < ActiveRecord::Base
  belongs_to :location
  belongs_to :category

  validate :_type_valid?
  
  def _type_valid?
  	(studies and postgrad) or (studies and !postgrad) or not (!studies and postgrad)
  	# tudzież (studies && postgrad) || (studies && !postgrad) || !(!studies && postgrad)
  	# czyli dopuszczalne nastepujące typy: 
  	# *studia podyplomowe
  	# *studia normalne
  	# *szkolenia
  	# nie dopuszczamy innych, szkolenia [czyli nie-studia] podyplomowe będą błędne
  	# formularze nie powinny na to pozwolić, ale ktoś może przy nich manipulować, takze tak na wszelki wypadek:)
	# prawdopodobnie możnaby było się ograniczyć do `!(!studies && postgrad)`
  end
end
