json.extract! class_session, :id, :name, :description, :active, :start_time, :end_time, :instructor_id, :training_id, :created_at, :updated_at
json.url class_session_url(class_session, format: :json)
