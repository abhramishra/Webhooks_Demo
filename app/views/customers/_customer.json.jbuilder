json.extract! customer, :id, :info, :created_at, :updated_at
json.url customer_url(customer, format: :json)
