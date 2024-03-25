json.extract! instructor, :id, :name, :birth, :email, :document, :phone, :specialities, :user_id, :created_at, :updated_at
json.url instructor_url(instructor, format: :json)
