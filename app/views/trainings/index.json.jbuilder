json.array!(@trainings) do |training|
  json.extract! training, :name, :info, :moreinfo, :studies, :postgrad, :elearning, :paid, :costs, :term, :address, :organizer, :location_id, :category_id
  json.url training_url(training, format: :json)
end
