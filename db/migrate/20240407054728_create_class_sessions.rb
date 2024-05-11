class CreateClassSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :class_sessions do |t|
      t.string :name
      t.string :description
      t.boolean :active
      t.datetime :start_time
      t.datetime :end_time
      t.references :instructor, null: false, foreign_key: true
      t.references :training, null: false, foreign_key: true

      t.timestamps
    end
  end
end
