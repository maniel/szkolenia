json.array!(@organizers) do |organizer|
  json.extract! organizer, :name, :address, :contact, :link, :college
  json.url organizer_url(organizer, format: :json)
end
