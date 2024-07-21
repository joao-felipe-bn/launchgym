class Student < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["name", "birth_date", "email", "document", "phone", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["class_session_students", "class_sessions", "user"]
  end

  belongs_to :user

  #has_many :class_session_students, dependent: :destroy
  has_many :class_session_students
  has_many :class_sessions, through: :class_session_students
end
