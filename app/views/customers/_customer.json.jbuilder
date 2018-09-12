json.extract! customer, :id, :name, :city, :direction, :observation, :active, :created_at, :updated_at
json.url customer_url(customer, format: :json)
