class Student < ApplicationRecord
  belongs_to :user

  has_many :class_session_students, dependent: :destroy
  has_many :class_sessions, through: :class_session_students
end
