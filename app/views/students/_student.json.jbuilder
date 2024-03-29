json.extract! student, :id, :name, :birth_date, :email, :document, :phone, :user_id, :created_at, :updated_at
json.url student_url(student, format: :json)
