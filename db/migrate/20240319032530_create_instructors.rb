class CreateInstructors < ActiveRecord::Migration[7.1]
  def change
    create_table :instructors do |t|
      t.string :name
      t.date :birth
      t.string :email
      t.string :document
      t.string :phone
      t.text :specialities
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
