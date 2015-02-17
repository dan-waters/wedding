json.array!(@payments) do |payment|
  json.extract! payment, :id, :item_id, :person_id, :amount
  json.url item_payment_url([item, payment], format: :json)
end
