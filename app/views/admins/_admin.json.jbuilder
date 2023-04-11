json.extract!(admin, :id, :full_name, :email, :phone, :role, :created_at, :updated_at)
json.url(admin_url(admin, format: :json))
