class Instructor < ApplicationRecord
  
  def self.ransackable_attributes(auth_object = nil)
    ["birth", "created_at", "document", "email", "id", "id_value", "name", "phone", "specialities", "updated_at", "user_id"]
  end

  belongs_to :user
end
