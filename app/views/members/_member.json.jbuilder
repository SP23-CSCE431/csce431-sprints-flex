json.extract!(member, :id, :full_name, :email, :phone, :role, :created_at, :updated_at)
json.url(member_url(member, format: :json))
