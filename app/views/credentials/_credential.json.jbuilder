json.extract! credential, :id, :consumer_key, :consumer_secret, :administrator_id, :enabled, :created_at, :updated_at
json.url credential_url(credential, format: :json)
