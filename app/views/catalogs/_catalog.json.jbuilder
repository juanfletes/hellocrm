json.extract! catalog, :id, :code, :parent_code, :name, :description, :active, :created_at, :updated_at
json.url catalog_url(catalog, format: :json)
