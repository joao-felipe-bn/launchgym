class ClassSession < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["active", "created_at", "description", "end_time", "id", "id_value", "instructor_id", "name", "start_time", "training_id", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["class_session_students", "instructor", "students", "training"]
  end

  belongs_to :instructor
  belongs_to :training

  #has_many :class_session_students, dependent: :destroy
  has_many :class_session_students
  has_many :students, through: :class_session_students
  
end
