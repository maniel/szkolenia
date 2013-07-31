# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(%w[augustowski białostocki bielski grajewski hajnowski kolneński łomżyński moniecki sejneński siemiatycki sokólski suwalski wysokomazowiecki zambrowski]+
	["M. Białystok", "M. Łomża", "M. Suwałki"]).each do |powiat|
	Location.find_or_create_by_name(name:"powiat "+powiat)
end
Location.find_or_create_by_name(name: "cała Polska")


#szkolenia
["Administracja i organizacja","Artystyczne","Ekologia","Finanse","Informatyka","Języki","Logistyka","Marketing","Medycyna","Motoryzacja","organizacjaPrawo","Psychologia",
	"Szkolnictwo","Techniczne","Tematyka unijna","Umiejętności osobiste","Zarządzanie Zasobami Ludzkimi","Zawodowe","Zdrowie i uroda","Inne"].each do |dziedzina|
		Category.find_or_create_by_name(name:dziedzina,studies: false)
end

#studia
["Artystyczne","Ekonomiczne","Filologiczne","Hotelarskie/Turystyczne/Sportowe","Humanistyczne","Medyczne","Muzyczne","Prawnicze","Przyrodnicze","Rolnicze","Społeczne",
	"Ścisłe","Techniczne","Teologiczne","Inne"].each do |dziedzina|
		Category.find_or_create_by_name(name:dziedzina,studies: true)
end