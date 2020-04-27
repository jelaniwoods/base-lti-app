json.extract! submission, :id, :enrollment_id, :resource_id, :score, :created_at, :updated_at
json.url submission_url(submission, format: :json)
