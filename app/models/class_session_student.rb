class ClassSessionStudent < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["class_session_id", "created_at", "id", "id_value", "student_id", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["class_session", "student"]
  end
#  belongs_to :student
#  belongs_to :class_session

  belongs_to :student, foreign_key: 'student_id'
  belongs_to :class_session, foreign_key: 'class_session_id'
end
