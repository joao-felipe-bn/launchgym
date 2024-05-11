class ClassSession < ApplicationRecord
  belongs_to :instructor
  belongs_to :training

  has_many :class_session_students, dependent: :destroy
  has_many :students, through: :class_session_students
  
end
