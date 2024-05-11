class CreateClassSessionStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :class_session_students do |t|
      #t.references :students, null: false, foreign_key: true
      #t.references :class_sessions, null: false, foreign_key: true

      t.references :student, null: false, foreign_key: true
      t.references :class_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
