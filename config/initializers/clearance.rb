Clearance.configure do |config|
	config.cookie_expiration = lambda { 1.year.from_now.utc }
	if Rails.env.production?
		config.redirect_url = '/baza/trainings'
	else
		config.redirect_url = '/trainings'
	end
end
