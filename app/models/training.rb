class Training < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "durantion_minutes", "id", "id_value", "name", "reps", "single", "updated_at"]
    end

    include Pagy::Frontend
end
