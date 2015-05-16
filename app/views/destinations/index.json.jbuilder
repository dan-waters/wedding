json.array!(@destinations) do |destination|
  json.extract! destination, :id, :name, :arrival_date, :departure_date, :honeymoon_id
  json.url honeymoon_destination_url(destination, format: :json)
end
