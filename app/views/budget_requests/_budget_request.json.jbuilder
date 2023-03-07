json.extract!(budget_request, :id, :admin_id, :is_approved, :description, :value, :created_at, :updated_at)
json.url(budget_request_url(budget_request, format: :json))
