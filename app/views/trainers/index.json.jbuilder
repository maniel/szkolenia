json.array!(@trainers) do |trainer|
  json.extract! trainer, :name, :info, :photo
  json.url trainer_url(trainer, format: :json)
end
