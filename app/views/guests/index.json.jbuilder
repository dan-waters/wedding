json.array!(@guest) do |guest|
  json.extract! guest, :id, :name, :invited, :accepted
  json.url destination_url(guest, format: :json)
end
