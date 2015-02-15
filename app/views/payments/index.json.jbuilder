json.array!(@payments) do |payment|
  json.extract! payment, :id, :item_id, :person_id, :amount
  json.url payment_url(payment, format: :json)
end
