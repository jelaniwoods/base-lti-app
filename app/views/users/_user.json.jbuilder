json.extract! user, :id, :first_name, :last_name, :preferred_name, :id_from_tc, :created_at, :updated_at
json.url user_url(user, format: :json)
