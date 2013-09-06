json.array!(@organizers) do |organizer|
  json.extract! organizer, :name, :address, :contact, :link
  json.url organizer_url(organizer, format: :json)
end
