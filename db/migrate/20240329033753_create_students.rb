class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :name
      t.date :birth_date
      t.string :email
      t.string :document
      t.string :phone
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
