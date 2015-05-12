json.array!(@honeymoons) do |honeymoon|
  json.extract! honeymoon, :id, :from, :to
  json.url honeymoon_url(honeymoon, format: :json)
end
