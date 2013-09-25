Clearance.configure do |config|
	config.cookie_expiration = lambda { 1.year.from_now.utc }
	config.redirect_url = '/trainings'
end
