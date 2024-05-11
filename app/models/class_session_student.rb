class ClassSessionStudent < ApplicationRecord
#  belongs_to :student
#  belongs_to :class_session

  belongs_to :student, foreign_key: 'students_id'
  belongs_to :class_session, foreign_key: 'class_sessions_id'
end
