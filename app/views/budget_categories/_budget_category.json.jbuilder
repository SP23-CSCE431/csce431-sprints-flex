json.extract!(budget_category, :id, :name, :created_at, :updated_at)
json.url(budget_category_url(budget_category, format: :json))
